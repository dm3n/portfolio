# Symphony — A Jira-Native Autonomous Software-Development Runner

> 📦 **Full dedicated repository: [`github.com/dm3n/symphony`](https://github.com/dm3n/symphony)** — complete engineering design record (architecture, state machine, hardening, deployment, security, and sanitized reference interfaces). This page is the portfolio‑level summary.

> **Designed and built by Daniel Edgar as CTO of Finsider. Deployed live in Finsider's active development environment**, where it takes product tickets from backlog to reviewed, evidence‑backed pull requests with a human in the loop.

> *Note on confidentiality:* this document describes the **architecture and engineering**. Employer‑internal specifics (private repository URLs, the Jira instance, internal project keys, and credentials) are intentionally generalized.

Symphony is the flagship demonstration of original, production‑grade agentic engineering in this portfolio. It is not a wrapper around an LLM — it is a **supervised multi‑agent operating system for software delivery**, with a real state machine, evidence gating, adversarial review critics, failure recovery, and two production deployment targets.

---

## 1. What it is

Symphony is a **ticket‑driven autonomous development runner**. Given a Jira ticket, it:

1. Detects eligible tickets and classifies their scope (single‑repo vs cross‑repo).
2. Provisions an **isolated git workspace** per ticket on a dedicated feature branch.
3. Invokes a coding agent (Claude Code) with a rendered **acceptance contract** built from the ticket's acceptance criteria.
4. Captures **visual evidence** (screenshots / Playwright video) of the running result.
5. Routes the ticket to a **human reviewer** with the evidence attached.
6. Interprets reviewer feedback (question vs rework vs approval) and loops as needed.
7. On approval, squashes the branch, force‑with‑lease pushes, and opens a **draft GitHub PR** linked back to the ticket.

**Design philosophy: the Jira ticket is the single source of truth.** All lifecycle state lives in Jira — its status and labels *are* the control flow. There is no external queue or database. Reviewers (technical or not) just use Jira (or Slack); no separate dashboard exists or is needed.

This is a direct engineering response to the [Uncertainty Propagation](01-research-uncertainty-propagation.md) thesis: rather than trusting one long autonomous chain (which decays exponentially), Symphony decomposes delivery into short, individually‑verified, human‑gated steps with evidence checkpoints — keeping per‑step failure low and never letting a silent error reach production.

---

## 2. The lifecycle / state machine

State is expressed entirely through Jira **statuses** and **labels**:

```
Human creates ticket
        │  (moves to "Selected for Development" / adds agent-ready label)
        ▼
[PICKUP]  Symphony polls (~15s), checks eligibility
        ▼
[IMPLEMENT]  isolate workspace → render acceptance contract → run agent
        ▼
[VALIDATE]   run repo build/test; capture screenshots/video evidence
        ▼
[HUMAN REVIEW]  attach evidence → label agent-human-review → transition to "human review"
        │
        ├─ reviewer asks a question  → Symphony answers in Jira, stays in review
        ├─ reviewer requests changes → label agent-rework → re-run agent (loop to IMPLEMENT)
        └─ reviewer approves         → human moves to "PR Submitted"/agent-pr-approved
                                            ▼
                                      [PR]  squash → force-with-lease push → gh pr create --draft
                                            → label agent-pr-submitted (prevents re-PR) → link PR in Jira
```

**Reviewer feedback is classified by intent**, which is what keeps the loop tight:

| Reviewer comment | Detected intent | Symphony action |
|---|---|---|
| "Should this use the old chart style?" | Question | Answer in Jira, **stay** in review |
| "Can you make the header smaller?" | Rework (question‑shaped but an action request) | Move to Rework, re‑run agent |
| "change / fix / move / remove / align / spacing…" | Rework | Move to Rework with a focused brief |
| "looks good / lgtm / ship it" | Approval | Wait for the human to move to PR status |
| "ok / thanks" | Neutral | Record, no action |

A dedicated set of heuristics (`is_rework_comment`, `is_question_comment`, `is_action_request_question`, `is_approval_comment`, `is_neutral_review_comment`) prevents the costly false positives in both directions — answering a change request as if it were a question, or re‑running the agent because someone said "thanks."

---

## 3. Core components

A single ~2,300‑line Python 3 orchestrator coordinates everything (no heavy framework — just the standard library plus the `git`/`gh`/`npm`/Playwright CLIs):

- **Jira client** — JQL search, comments, transitions, labels, file attachments; converts Jira's Atlassian Document Format to plain text.
- **Scope analyzer** (`analyze_issue_scope`) — reads title/description/acceptance criteria, matches them against per‑repo term lists, and decides single‑repo vs cross‑repo plus the exact set of repos that must change.
- **Acceptance‑contract renderer** (`render_prompt`) — injects ticket details and a parsed acceptance‑criteria checklist into a `WORKFLOW.md` template, instructing the agent to verify every criterion before handoff.
- **Workspace manager** — per‑ticket isolated clone on an `agent/{ticket}` branch, pinned git identity, and git excludes so evidence never gets committed.
- **Agent runner** (`run_codex`) — spawns the coding agent, supervises the process tree, and enforces timeouts and exit‑code semantics.
- **Evidence finder** — collects screenshots/video with **minimum file‑size thresholds** to reject fake/empty evidence.
- **Validation runner** — runs the repo's real build/test command and blocks review on failure.
- **Review‑comment & Slack handlers** — poll Jira comments and Slack thread replies, classify intent, and act; state‑tracked to avoid double‑processing.
- **PR manager** — squash, safe push, draft‑PR creation, and a terminal label to prevent duplicate PRs.
- **Failure recovery** — bounded auto‑retry with cooldown for failed runs.

---

## 4. Engineering hardening (the parts that make it production‑grade)

These are the details that separate a demo from a system trusted to act on a live codebase:

- **Evidence‑gated PRs.** No PR is created until implementation is done, validation passes, evidence is attached, *and* a human has approved. Non‑technical reviewers literally see the running UI before code review starts.
- **Preflight cross‑repo scope detection + review critic.** If a ticket needs changes in multiple repos but only one was touched, Symphony blocks review (`agent-cross-repo-needed`) and explains what's missing instead of handing over an incomplete change.
- **Acceptance contracts.** Free‑form Jira acceptance criteria are parsed into an explicit verification checklist embedded in the agent prompt.
- **Frontend design‑system guardrails.** Every frontend ticket carries explicit rules (preserve design tokens, use shadcn/ui primitives, no global font/color/spacing changes, no decorative drift) — moving design consistency from code review into the agent's instructions.
- **Fake‑evidence prevention.** Minimum sizes for images/video; explicit policy against synthetic "evidence" that is just text.
- **Safe git.** Pushes use `--force-with-lease` (never raw `--force`); on a stale lease it fetches and retries, then aborts gracefully rather than clobbering.
- **Pinned commit identity.** Git author/committer identity is pinned per workspace and via environment so authorship is consistent and auditable.
- **Process‑tree cleanup + dev‑server watchdog.** Descendant processes (dev servers, headless Chromium) are recursively terminated on timeout/cancel; long‑running dev servers are killed after evidence capture + grace, preventing zombie processes and resource leaks.
- **Ticket‑deletion watchdog.** If a ticket is deleted mid‑run, the agent process is terminated cleanly.
- **Review‑comment baselining.** On first handoff, existing comments are marked processed so stale feedback never re‑triggers the agent.
- **Bounded failure auto‑retry.** Run/validation/evidence failures retry a capped number of times with a cooldown, with state persisted to disk.
- **Runtime pinning + preflight checks.** Node version pinned for native backend deps; startup validates credentials, required CLIs, repo access, and the authenticated GitHub identity before doing anything.
- **Single‑instance daemon.** An `fcntl` file lock guarantees one runner; a second invocation exits cleanly.

---

## 5. Tech stack

- **Orchestrator:** Python 3 (stdlib only — `urllib`, `subprocess`, `threading`/`concurrent.futures`, `fcntl`, `pathlib`).
- **Coding agent:** Claude Code (CLI), driven headlessly with a rendered prompt.
- **Evidence:** Node.js + Playwright (headless browser screenshot/video; Xvfb on Linux).
- **Integrations:** Jira Cloud REST API (state), GitHub via `gh` CLI (draft PRs), Slack (webhook or bot token, thread‑per‑ticket).
- **State store:** Jira itself, plus small JSON state files (processed comments, retry counts, Slack thread IDs) and per‑run logs.
- **Deployment:** macOS LaunchAgent (KeepAlive + RunAtLoad) for local; **systemd on a GCP Compute Engine VM** (Ubuntu 24.04) for always‑on production, provisioned by a one‑shot deploy script.

---

## 6. System diagram

```
            ┌──────────────────────────────────────────────┐
            │      Jira  (single source of truth)          │
            │  status + labels = control flow · comments   │
            └───────▲───────────────▲───────────────▲──────┘
       poll (~15s)  │   classify     │   labels /     │ attach
                    │   comments     │   transitions  │ evidence
            ┌───────┴────────────────┴────────────────┴──────┐
            │     Symphony daemon  (Python 3, thread pool)    │
            │                                                 │
            │  poll → scope analysis → acceptance contract    │
            │      → run agent (supervised) → validate        │
            │      → capture evidence → human-review handoff   │
            │      → classify feedback → rework loop          │
            │      → on approval: squash → push → draft PR    │
            └───────┬───────────────┬───────────────┬─────────┘
                    ▼               ▼               ▼
              GitHub (draft     Slack (thread     Local FS
               PRs only)        per ticket)    (workspaces, evidence, logs)
```

---

## 7. Why it's notable

Symphony embodies a clear and unusually mature thesis about autonomous AI in production: **agents are capable implementers but should not hold approval authority.** So the system gives the agent real power — isolated workspaces, full implementation, validation, evidence generation, branch and PR operations — while routing every *decision* (scope completeness, visual correctness, merge approval) through a human, and making that human's job trivial by attaching evidence and classifying intent automatically.

The result is a working instance of supervised autonomy: dozens of tickets driven from description to evidence‑backed, review‑gated PR, with the hard parts (safe git, process hygiene, failure recovery, cross‑repo correctness, fake‑evidence rejection) actually solved rather than hand‑waved. It is, in effect, *the tooling that builds the product* — built by the same person who wrote the theory explaining why it has to work this way.

---

## Extended information

This page is the portfolio‑level summary. The **full engineering design record** — deep‑dive architecture, the complete Jira‑native state machine, the production‑hardening catalog, deployment topology, observability, the security/trust model, and sanitized reference interfaces (config schema, the acceptance‑contract prompt template, and the orchestrator interface skeleton) — lives in the dedicated repository:

### 👉 [github.com/dm3n/symphony](https://github.com/dm3n/symphony)

| Deep dive | |
|---|---|
| [Architecture](https://github.com/dm3n/symphony/blob/main/docs/architecture.md) | Components, data flow, orchestrator, integrations |
| [State machine](https://github.com/dm3n/symphony/blob/main/docs/state-machine.md) | Every status, label, transition, and the feedback classifier |
| [Hardening](https://github.com/dm3n/symphony/blob/main/docs/hardening.md) | Safe git, watchdogs, evidence integrity, failure recovery |
| [Deployment](https://github.com/dm3n/symphony/blob/main/docs/deployment.md) | macOS LaunchAgent + GCP/systemd |
| [Security](https://github.com/dm3n/symphony/blob/main/docs/security.md) · [Design rationale](https://github.com/dm3n/symphony/blob/main/docs/design-rationale.md) | Trust model + the "why" behind every decision |
