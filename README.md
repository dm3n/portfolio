# Daniel Ray Edgar — AI Systems Portfolio

**Founder · CTO · AI systems engineer & researcher.**
Building applied AI for high‑stakes financial work — and the autonomous tooling that builds it.

> This repository is a single, navigable body of evidence of original contributions to the field of artificial intelligence: production AI systems, novel agentic workflows, an independent research paper validated against frontier models, and the engineering infrastructure behind it all. It consolidates work across three ventures — **Flagpost AI** (Antler‑backed; Co‑founder/CEO), **Airbank** (M&A‑AI; Founder), and **Finsider** (CTO) — into one place.

---

## Who I am

I'm Daniel Edgar — a self‑taught founder and engineer working at the intersection of large language models and financial workflows. I have:

- **Designed and shipped production AI platforms** that turn messy financial documents into auditable, source‑linked analysis — for M&A Quality‑of‑Earnings and Canadian mortgage underwriting.
- **Built Symphony**, a Jira‑native autonomous software‑development runner deployed live at Finsider that takes product tickets all the way to evidence‑backed, human‑reviewed pull requests.
- **Written original research** — a single‑author paper formalizing how errors propagate through multi‑step LLM reasoning, with theory confirmed to ~1% error against GPT‑5, Claude Opus 4.6, Claude Sonnet 4.6, and Gemini 3.1 Pro.
- **Engineered my own "engineering OS"** — a multi‑agent coding pipeline, persistent knowledge brain, and self‑hosted homelab that lets one person operate like a team.
- Been selected by **Antler Canada** (from thousands of applicants) and backed with a pre‑seed SAFE investment.

A consistent thread runs through all of it: **applied AI for high‑stakes work, built with auditability and supervised autonomy as first principles** — and a willingness to build the tooling, not just the product.

---

## Start here

| # | Document | What it covers |
|---|---|---|
| 01 | [Research — Uncertainty Propagation](docs/01-research-uncertainty-propagation.md) | Original single‑author paper: the theory of why long LLM reasoning fails, and when trees fix it. Validated on 4 frontier models. |
| 02 | [Symphony Architecture](docs/02-symphony-architecture.md) | **Flagship.** A Jira‑native autonomous dev runner — full architecture, state machine, and production hardening. |
| 03 | [Airbank Platforms](docs/03-airbank-platforms.md) | AI systems for M&A Quality‑of‑Earnings and mortgage underwriting — RAG, confidence‑scored extraction, auditable cells, fraud detection. |
| 04 | [Finsider — CTO](docs/04-finsider-cto.md) | The CTO role: platform engineering, financial correctness, and the delivery infrastructure (Symphony). |
| 05 | [Ventures & Trajectory](docs/05-ventures-and-companies.md) | Flagpost → Airbank → Finsider: founder/CEO to CTO, with Antler backing. |
| 06 | [Projects Portfolio](docs/06-projects-portfolio.md) | Shipped products: ROGI, VisionClaw (accessibility AI on Meta glasses), and more. |
| 07 | [The Engineering OS — "Macintosh"](docs/07-engineering-os-macintosh.md) | The multi‑agent pipeline + knowledge brain + homelab that powers the velocity. |
| 08 | [O‑1A Evidence Map](docs/08-o1a-evidence-map.md) | How this body of work maps to the extraordinary‑ability criteria (for counsel). |

---

## Selected work, at a glance

### Symphony — supervised‑autonomy software delivery *(Finsider, CTO)*
A ~2,300‑line Python orchestrator that drives Jira tickets to draft PRs: isolated per‑ticket workspaces, acceptance‑contract prompting of a coding agent, Playwright evidence capture, intent‑classified human review, safe `--force-with-lease` git, cross‑repo scope critics, fake‑evidence rejection, and bounded failure recovery — deployed via macOS LaunchAgent and an always‑on GCP/systemd VM. → [Architecture](docs/02-symphony-architecture.md)

### Uncertainty Propagation in Tree‑Structured LLM Reasoning *(independent research)*
Proves chain success `= ∏(1−θᵢ)` decays exponentially while majority‑vote trees decay only *sub*‑exponentially; derives the compute‑optimal tree shape; validates to ~1% MAE across four frontier models. Signature result: at a fixed 48‑step budget, a chain ≈ 0.2% success vs a depth‑3 tree at 97.9%. → [Paper writeup](docs/01-research-uncertainty-propagation.md) · [`uncertainty-propagation`](https://github.com/dm3n/uncertainty-propagation)

### Airbank QoE & Mortgage platforms *(Airbank, Founder)*
RAG‑grounded, section‑by‑section financial extraction with calibrated confidence and source‑linked auditable cells; Canadian mortgage document extraction with fraud‑signal detection and autonomous lifecycle orchestration. → [Architecture](docs/03-airbank-platforms.md)

### VisionClaw — real‑time AI vision for the blind *(Meta Ray‑Ban + Gemini Live)*
Hands‑free, resilient, accessibility‑first assistant that narrates the world through smart glasses. → [`VisionClaw`](https://github.com/dm3n/VisionClaw)

---

## Repository index

**Research**
- [`uncertainty-propagation`](https://github.com/dm3n/uncertainty-propagation) — the paper (LaTeX)
- [`human-divinity`](https://github.com/dm3n/human-divinity) — second long‑form research manuscript

**AI platforms & products**
- [`airbank`](https://github.com/dm3n/airbank) — Airbank QoE Platform *(private)*
- [`airbank-mortgage-platform`](https://github.com/dm3n/airbank-mortgage-platform) — AI mortgage underwriting *(private)*
- [`rogi`](https://github.com/dm3n/rogi) · [`rogi-v2`](https://github.com/dm3n/rogi-v2) — AI‑native mortgage intake funnel
- [`VisionClaw`](https://github.com/dm3n/VisionClaw) — AI vision assistant for Meta Ray‑Ban glasses
- [`sacred-secretion-agent`](https://github.com/dm3n/sacred-secretion-agent) — fully autonomous email agent
- [`ventureroadmap`](https://github.com/dm3n/ventureroadmap) — venture‑building platform *(private)*

**Engineering infrastructure**
- [`macintosh`](https://github.com/dm3n/macintosh) — my multi‑agent engineering OS + homelab + knowledge brain

**Earlier work**
- [`nodebase`](https://github.com/dm3n/nodebase) · [`nassau`](https://github.com/dm3n/nassau) · [`OpenCV`](https://github.com/dm3n/OpenCV) · [`ratestore`](https://github.com/dm3n/ratestore)

*Symphony is deployed inside Finsider's private engineering environment; its architecture is documented in full [here](docs/02-symphony-architecture.md).*

---

## A note on privacy

This is a **public** repository. To protect the privacy of investors, customers, and partners, it deliberately contains **no** raw investor/customer names, dollar figures, SAFE terms, or cap‑table data. That corroborating evidence is maintained in a private data room and is available to counsel on request. See the [O‑1A Evidence Map](docs/08-o1a-evidence-map.md).

---

<sub>Maintained by Daniel Ray Edgar · [finsider.ai](https://finsider.ai) · GitHub [@dm3n](https://github.com/dm3n)</sub>
