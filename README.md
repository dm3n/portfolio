# Daniel Ray Edgar: AI Systems Portfolio

**Chief Technology Officer · founder · AI systems engineer & researcher.**
Automating Quality‑of‑Earnings and the highest‑stakes work in finance, and building the autonomous tooling that builds it.

> A single, navigable body of evidence of original contributions to artificial intelligence: production AI systems, novel agentic workflows, an independent research paper validated against frontier models, and the engineering infrastructure behind it all, built across three ventures: **Flagpost AI** (Antler‑backed; Co‑founder/CEO), **Airbank** (M&A‑AI; Founder), and **Finsider** (CTO).

---

## Who I am

I'm Daniel Edgar. I'm **20 years old**, the **Chief Technology Officer of [Finsider](https://finsider.ai)**, and I build AI systems for the highest‑stakes work in finance.

I studied **Computer Science at Queen's University** (one of Canada's top engineering schools) then left to build. Before I was 20, I had:

- **Raised $220,000 at a $2.2M valuation**, selected by **Antler Canada** out of thousands of applicants, as Co‑founder & CEO of **Flagpost AI**.
- **Stepped aside from my own funded company** to chase a bigger thesis (an AI‑native operating system for M&A) and founded **Airbank**, where I designed and shipped production platforms for Quality‑of‑Earnings and mortgage underwriting.
- **Joined [Finsider](https://finsider.ai) as full‑time CTO on a $200K salary**, automating Quality‑of‑Earnings: the mandatory, six‑figure financial diligence behind every M&A deal.

Along the way I have:

- **Designed and shipped production AI platforms** that turn messy financial documents into auditable, source‑linked analysis, for M&A Quality‑of‑Earnings and Canadian mortgage underwriting.
- **Built [Symphony](https://github.com/dm3n/symphony)**: a Jira‑native autonomous software‑development runner deployed live at Finsider that drives product tickets all the way to evidence‑backed, human‑reviewed pull requests. It is supervised‑autonomy infrastructure: the tooling that builds the product.
- **Written original research**: three single‑author papers. The first formalizes how errors propagate through multi‑step LLM reasoning, with theory confirmed to **~1% error** against **GPT‑5, Claude Opus 4.6, Claude Sonnet 4.6, and Gemini 3.1 Pro**, and a headline result that reframes how to spend inference compute. The second, **The Information‑Maintenance Hypothesis**, argues that aging, intelligence, and markets are one problem in information theory, anchored on two theorems (Landauer's principle and the Kelly–Cover identity). The third, **From Reading to Writing the Genome**, argues that biology is inverting from a reading science into a writing one, driven by generative models, and is rigorous about the ceiling: we can design molecules, not organisms.
- **Engineered my own "engineering OS"** (a multi‑agent coding pipeline, persistent knowledge brain, and self‑hosted homelab) that lets one person ship like a team.
- **Built full products from scratch across the stack**: from a complete e‑commerce platform with payments and a headless CMS, to an accessibility AI that narrates the world through smart glasses.

The throughline: I don't just *use* AI, I **formalize the theory, design the systems, and build the infrastructure that runs them**, with auditability and supervised autonomy as first principles. I move from a probability proof to a production deployment in the same week, and I build the tooling, not just the product.

---

## Start here

| # | Document | What it covers |
|---|---|---|
| 01 | [Research: Uncertainty Propagation](docs/01-research-uncertainty-propagation.md) | Original single‑author paper: the theory of why long LLM reasoning fails, and when trees fix it. Validated on 4 frontier models. |
| 02 | [Symphony Architecture](docs/02-symphony-architecture.md) | **Flagship.** A Jira‑native autonomous dev runner: full architecture, state machine, and production hardening. |
| 03 | [Airbank Platforms](docs/03-airbank-platforms.md) | AI systems for M&A Quality‑of‑Earnings and mortgage underwriting: RAG, confidence‑scored extraction, auditable cells, fraud detection. |
| 04 | [Finsider: CTO](docs/04-finsider-cto.md) | The CTO role: platform engineering, financial correctness, and the delivery infrastructure (Symphony). |
| 05 | [Ventures & Trajectory](docs/05-ventures-and-companies.md) | Flagpost → Airbank → Finsider: founder/CEO to CTO, with Antler backing. |
| 06 | [Projects Portfolio](docs/06-projects-portfolio.md) | Shipped products: ROGI, VisionClaw (accessibility AI on Meta glasses), and more. |
| 07 | [The Engineering OS: "Macintosh"](docs/07-engineering-os-macintosh.md) | The multi‑agent pipeline + knowledge brain + homelab that powers the velocity. |
| 08 | [O‑1A Evidence Map](docs/08-o1a-evidence-map.md) | How this body of work maps to the extraordinary‑ability criteria (for counsel). |
| 09 | [Research: The Information‑Maintenance Hypothesis](docs/09-research-information-maintenance.md) | Second single‑author paper: aging, intelligence, and markets as one information‑theoretic problem, anchored on two theorems. |
| 10 | [Research: From Reading to Writing the Genome](docs/10-research-ai-designed-life.md) | Third single‑author paper: biology's shift from reading to writing genomes, the cost‑per‑validated‑design economics of AI biological design, and the molecule‑versus‑organism ceiling. |

---

## Selected work, at a glance

### Symphony: supervised‑autonomy software delivery *(Finsider, CTO)*
A ~2,300‑line Python orchestrator that drives Jira tickets to draft PRs: isolated per‑ticket workspaces, acceptance‑contract prompting of a coding agent, Playwright evidence capture, intent‑classified human review, safe `--force-with-lease` git, cross‑repo scope critics, fake‑evidence rejection, and bounded failure recovery, deployed via macOS LaunchAgent and an always‑on GCP/systemd VM. → **Dedicated repo: [`dm3n/symphony`](https://github.com/dm3n/symphony)** · [In‑portfolio writeup](docs/02-symphony-architecture.md)

### Uncertainty Propagation in Tree‑Structured LLM Reasoning *(independent research)*
Proves chain success `= ∏(1−θᵢ)` decays exponentially while majority‑vote trees decay only *sub*‑exponentially; derives the compute‑optimal tree shape; validates to ~1% MAE across four frontier models. Signature result: at a fixed 48‑step budget, a chain ≈ 0.2% success vs a depth‑3 tree at 97.9%. → [Paper writeup](docs/01-research-uncertainty-propagation.md) · [`uncertainty-propagation`](https://github.com/dm3n/uncertainty-propagation)

### The Information‑Maintenance Hypothesis *(independent research)*
A single‑author theory paper arguing that aging, intelligence, and markets are the same problem: maintaining a low‑entropy predictive model against entropy at a free‑energy cost. Anchored on two theorems, not analogies, **Landauer's principle** (`k_B T ln 2` per maintained bit) and the **Kelly–Cover identity** (`ΔW = I(X;Y)`, capital growth equals mutual information with the future); closes with eleven falsifiable predictions across biology, AI, and finance. → [Paper writeup](docs/09-research-information-maintenance.md) · [`information-maintenance-hypothesis`](https://github.com/dm3n/information-maintenance-hypothesis)

### From Reading to Writing the Genome *(independent research)*
A single‑author paper arguing that molecular biology is inverting from a *reading* science into a *writing* one: generative models propose biological designs, automated foundries build and test them, and the loop closes. It reduces the field's economics to one accounting identity, `CVD = (c_design + c_build + c_test) / p`, showing the experimental hit rate `p` is the high‑leverage term AI moves; surveys what works today (AlphaFold/ESMFold, RFdiffusion/ProteinMPNN, Evo/Evo 2, CRISPR and base/prime editing); and is deliberate about the ceiling, **we can design molecules, not organisms**. Closes with six falsifiable predictions, one of them a negative prediction that pins the ceiling. → [Paper writeup](docs/10-research-ai-designed-life.md) · [`ai-designed-life`](https://github.com/dm3n/ai-designed-life)

### Airbank QoE & Mortgage platforms *(Airbank, Founder)*
RAG‑grounded, section‑by‑section financial extraction with calibrated confidence and source‑linked auditable cells; Canadian mortgage document extraction with fraud‑signal detection and autonomous lifecycle orchestration. → [Architecture](docs/03-airbank-platforms.md)

### VisionClaw: real‑time AI vision for the blind *(Meta Ray‑Ban + Gemini Live)*
Hands‑free, resilient, accessibility‑first assistant that narrates the world through smart glasses. → [`VisionClaw`](https://github.com/dm3n/VisionClaw)

---

## Repository index: everything I've built

**Flagship systems**
- [`symphony`](https://github.com/dm3n/symphony): Jira‑native autonomous software‑delivery runner (architecture, state machine, hardening, reference interfaces) *(built at Finsider)*
- [`macintosh`](https://github.com/dm3n/macintosh): my multi‑agent engineering OS + self‑hosted homelab + persistent knowledge brain

**Research**
- [`uncertainty-propagation`](https://github.com/dm3n/uncertainty-propagation): single‑author paper on LLM reasoning reliability (LaTeX)
- [`information-maintenance-hypothesis`](https://github.com/dm3n/information-maintenance-hypothesis): single‑author theory paper unifying aging, intelligence, and markets via information theory (LaTeX)
- [`ai-designed-life`](https://github.com/dm3n/ai-designed-life): single‑author paper on generative models and the closing of biology's design loop (LaTeX)
- [`human-divinity`](https://github.com/dm3n/human-divinity): long‑form research manuscript (LaTeX)

**AI platforms & products**
- [`airbank`](https://github.com/dm3n/airbank): Airbank QoE Platform, M&A Quality‑of‑Earnings automation *(private)*
- [`airbank-mortgage-platform`](https://github.com/dm3n/airbank-mortgage-platform): AI mortgage underwriting & fraud detection *(private)*
- [`rogi`](https://github.com/dm3n/rogi) · [`rogi-v2`](https://github.com/dm3n/rogi-v2): AI‑native mortgage intake funnel (first version **sold for $7,500**)
- [`VisionClaw`](https://github.com/dm3n/VisionClaw): real‑time AI vision assistant for Meta Ray‑Ban glasses (accessibility)
- [`sacred-secretion-agent`](https://github.com/dm3n/sacred-secretion-agent): fully autonomous lunar‑cycle email agent
- [`ventureroadmap`](https://github.com/dm3n/ventureroadmap): venture‑building platform *(private)*

**Full‑stack engineering**
- [`nassau`](https://github.com/dm3n/nassau): **complete golf e‑commerce platform built from scratch**, Next.js + Sanity headless CMS + Stripe payments + Firebase + React Query, with rich product UX (image zoom, carousels, live cart)
- [`nodebase`](https://github.com/dm3n/nodebase): full‑stack TypeScript application
- [`ratestore`](https://github.com/dm3n/ratestore): TypeScript web app
- [`OpenCV`](https://github.com/dm3n/OpenCV): real‑time hand‑tracking / computer vision (Python)

*Symphony also runs inside Finsider's private engineering environment; the public [`symphony`](https://github.com/dm3n/symphony) repo and the [in‑portfolio writeup](docs/02-symphony-architecture.md) document its architecture in full.*

---

## A note on privacy

This is a **public** repository. To protect the privacy of investors, customers, and partners, it deliberately contains **no** raw investor/customer names, dollar figures, SAFE terms, or cap‑table data. That corroborating evidence is maintained in a private data room and is available to counsel on request. See the [O‑1A Evidence Map](docs/08-o1a-evidence-map.md).

---

<sub>Maintained by Daniel Ray Edgar · [finsider.ai](https://finsider.ai) · GitHub [@dm3n](https://github.com/dm3n)</sub>
