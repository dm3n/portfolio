# Airbank Platforms: AI Systems for M&A and Mortgage Finance

Two production platforms designed and built end‑to‑end under Airbank, the bridge venture between Flagpost and Finsider. Both attack the same hard problem from different angles: **turning messy, high‑stakes financial documents into defensible, source‑linked analysis**, fast enough to change the economics of the work.

Shared foundation: **Next.js 16 · React 19 · TypeScript · Supabase (Postgres + RLS + Auth + Storage) · Google Cloud Storage · Vertex AI (Gemini 2.0 Flash) · Vertex RAG · Vercel.**

---

## A. Airbank M&A Platform: Quality of Earnings + AI Data Room

### Purpose
An AI‑native M&A platform that automates the most manual parts of private‑equity diligence: an intelligent **Data Room** for document collection and organization, and an AI **Quality‑of‑Earnings (QoE)** engine that produces analyst‑grade financial workbooks. Today a QoE costs $25k–$250k and takes 6+ weeks; this engine compresses the financial analysis from weeks to hours, **without giving up auditability.**

### How the QoE engine works
The signature system is an **11‑section, RAG‑grounded extraction pipeline** where every number is traceable back to a source document:

1. **Corpus‑per‑workbook RAG.** Each engagement gets its own Vertex AI RAG corpus (GCS‑backed, ~2048‑token chunks, 512 overlap). Retrieval runs **parallel multi‑query** per section (queries tuned for financial terminology: "EBITDA adjustments", "management add‑backs", "D&A bridge"), then deduplicates chunks by content fingerprint.
2. **Section‑by‑section extraction** across Overview, Quality of Earnings, Income Statement, Margins by Month, Balance Sheet, Working Capital, Net Debt, Sales by Channel, Customer Concentration, Proof of Revenue, Proof of Cash, and Risk & Diligence.
3. **Three extraction modes**: *standard* (fixed required fields), *ranked* (positional vendor assignment), and a **hybrid discovery mode** that combines fuzzy anchor‑row matching (e.g. "Adjusted EBITDA" ≈ "EBITDA as Defined") with free discovery of all other rows. This is what makes it robust to the non‑standard statements real companies actually produce.
4. **Audit‑quality citation.** Every extracted cell carries its source document, page, and a verbatim excerpt: a human auditor verifies a value in seconds instead of re‑reading a PDF.
5. **Calibrated confidence + flags.** Each cell gets a confidence score (0.4–1.0); the model is engineered to **prefer a missing‑data flag over a fabricated value.** Low‑confidence cells, cross‑period discrepancies, and missing fields raise flags with a threaded comment‑resolution workflow.
6. **Deterministic fast path.** Clean Excel inputs **bypass the lossy PDF→RAG pipeline** entirely via a direct column‑mapping extractor: 100% accuracy where the data is already structured.
7. **Cross‑section reconciliation.** A formula resolver computes dependent rows (e.g. Gross Profit = Revenue − COGS), propagates confidence, and surfaces economic inconsistencies across sections.
8. **Live SSE streaming.** The client watches section‑by‑section progress in real time (15s keepalive to survive proxy timeouts); analysis continues server‑side even if the client disconnects.

Export to **Excel / Google Sheets / PDF**; multi‑model AI chat (Claude or Gemini) scoped to a workbook or data room; read‑only public sharing via signed tokens.

### Connection to the research
This is the [Uncertainty Propagation](01-research-uncertainty-propagation.md) thesis applied to document AI: decompose one long, high‑`θ` extraction into many short, independently‑verified steps, expose the **heterogeneous bottleneck steps** (low‑confidence cells) for human verification, and never let a single silent error propagate into the final report.

```
Analyst ─▶ Next.js 16 ─▶ /api/workbooks/[id]/analyze (SSE)
                              │
        ┌─────────────────────┼─────────────────────┐
        ▼                     ▼                     ▼
   Supabase (Postgres   Vertex RAG corpus      Gemini 2.0 Flash
   + RLS + Storage)     (per workbook, GCS)    section extraction
        │                     │                     │
        └───────── cells + source excerpts + confidence + flags ◀─┘
                              │
                  formula resolver ▶ cross‑section reconciliation ▶ export
```

---

## B. Airbank Mortgage Platform: AI Origination & Underwriting

### Purpose
A full‑stack, AI‑powered mortgage origination system for Canadian brokers that automates the entire borrower lifecycle: application → document upload with AI verification → underwriting audit → condition tracking → lender submission → funding. It serves borrowers (self‑service), underwriters (audit reports), operations (condition/lender tracking), and partners (referral CRM) in one system.

### Signature AI systems
- **Canadian‑specific document extraction.** T4 Box 14, NOA lines 15000/26000, pay‑stub YTD annualization, Letter‑of‑Employment expiry detection, bank‑statement balance + payroll‑pattern analysis, income‑type classification, and **2‑year averaging per OSFI guidelines.**
- **Fraud & integrity detection.** PDF metadata inspection (Creator/Producer flags for Photoshop/Illustrator/Canva), intra‑document font‑inconsistency detection, cross‑document name mismatches, income‑variance flags (T4 vs NOA), unexplained large‑deposit detection, rolled up into a "Confirmed Clean / Requires Review / High Risk" integrity score.
- **Borrower audit report** with six analyst tabs: Executive Summary, Verified Income, Asset & Down Payment, Fraud & Integrity, GDS/TDS engine (with stress‑test rate, pass/fail), and an Exception Desk.
- **One‑call intake orchestration.** A single submission from the public `/apply` funnel builds the tailored document checklist, creates the workbook + data room, round‑robin‑assigns a loan officer, mints a secure share token, and fires white‑label borrower email + officer email + SMS.
- **Real‑time upload verification.** On each upload, Gemini identifies the doc type and runs authenticity/account‑match/date‑range/fraud checks with an animated reveal, then auto‑routes accept / deny / needs‑review.
- **Autonomous lifecycle + pipeline orchestration.** Cron workers drive a 1–2‑day borrower reminder cadence and an hourly orchestration agent that scans active deals, detects stale files (>3 days) and closing‑soon (≤14 days) deals, and uses Gemini to generate role‑aware prioritized action items for each team member.
- **Campaign engine** for SMS/email drips with audience filtering and per‑recipient delivery logs.

> The borrower‑facing `/apply` funnel is the productionized descendant of **ROGI** (see [Projects Portfolio](06-projects-portfolio.md)).

```
Borrower ─▶ /apply (8‑step) ─▶ POST /api/intake ─▶ workbook + data room + officer + token
                                                          │
Borrower ─▶ /share/[token] ─▶ upload ─▶ Gemini verify ─▶ accept / deny / review
                                                          │
Underwriter ─▶ /workbooks/[id] ─▶ 6‑tab audit (income · assets · fraud · GDS/TDS)
                                                          │
   cron/reminders (lifecycle)   cron/orchestrate (role‑aware priorities)   campaigns
```

---

## What these platforms demonstrate (for the record)
- **Domain‑specialized AI**, not generic chat: M&A diligence and Canadian mortgage underwriting each have bespoke prompt systems, validators, and calculation engines.
- **Auditability as a first‑class constraint**: source excerpts, calibrated confidence, and flags instead of black‑box answers, which is what makes the output usable in regulated, high‑stakes finance.
- **Agentic automation**: SSE analysis pipelines, async job queues, and cron‑driven orchestration agents that act on a live pipeline without human prompting.
