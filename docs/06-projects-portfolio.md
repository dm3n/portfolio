# Projects Portfolio — Shipped AI Products

A selection of production AI systems designed and built end‑to‑end. Each links to its own repository for source‑level depth. Together they demonstrate range: consumer fintech, on‑device multimodal AI, accessibility, autonomous agents, and full‑stack operating systems — all shipped, not prototyped.

---

## ROGI — AI‑native mortgage intake & first‑time‑home‑buyer funnel
**Repos:** [`dm3n/rogi`](https://github.com/dm3n/rogi) · [`dm3n/rogi-v2`](https://github.com/dm3n/rogi-v2)
**Stack:** Next.js 16, React 19, TypeScript, Supabase, Tailwind v4, shadcn/ui

A guided, multi‑step intake funnel that walks a prospective borrower through income, property, and liability assessment and computes maximum affordable purchase price in real time.

- **Canadian mortgage qualification engine** implementing GDS/TDS ratios, the mortgage stress test, CMHC insurance brackets, and semi‑annual compounding for accurate affordability scoring.
- **Form state machine** with cross‑session localStorage persistence and **dynamic routing** — the step graph changes by mortgage type (Purchase / Pre‑approval / Refinance / Renewal).
- **Webhook integration** to downstream intake systems via a non‑blocking fire‑and‑forget pattern.

> Commercial validation: the first version was sold for **$7,500 from a dorm room** (this is the public repo's own description). The product later became the `/apply` funnel inside the Airbank Mortgage Platform.

---

## VisionClaw — real‑time AI vision assistant for Meta Ray‑Ban glasses
**Repo:** [`dm3n/VisionClaw`](https://github.com/dm3n/VisionClaw)
**Stack:** Swift / SwiftUI (iOS 17+), Meta Wearables DAT SDK, Gemini Live API (WebSocket), App Intents

An accessibility‑first assistant that streams live video from Meta Ray‑Ban glasses into Gemini Live, which continuously narrates the scene, reads text, and calls out hazards for visually impaired users.

- **Hands‑free Siri activation** — one voice command opens the app, starts the glasses video stream, and connects the AI session with zero touch interaction.
- **Resilient streaming** — automatic WebSocket reconnection on drop; stream auto‑pauses/resumes when the glasses are removed and put back on; all errors handled internally so the user never sees a technical failure.
- **Accessibility‑first prompt design** — the system prompt instructs the model to *proactively* narrate with spatial language ("door three steps ahead") rather than only answering questions. Full VoiceOver labeling throughout.

> Why it stands out: turns commodity hardware + a general model into a purpose‑built assistive device, with interaction friction engineered down to near zero.

---

## Venture Roadmap — venture‑building platform & coach funnel
**Repo:** [`dm3n/ventureroadmap`](https://github.com/dm3n/ventureroadmap) (private)
**Stack:** Next.js 16, React 19, TypeScript, Tailwind v4, shadcn/ui, Vitest

A productized 9‑phase roadmap for building an AI‑native venture (from agentic‑environment setup → industry discovery → automated outreach → closing → fulfillment → scale), with per‑phase workspaces and a coach‑booking flow.

- Interactive phase visualization with per‑phase outcomes, artifacts, and playbooks.
- Application flow via Typeform integration; partner/credibility carousel.
- Unit‑tested (Vitest) across hero, roadmap accordion, and CTA flows.

---

## Sacred Secretion Agent — fully autonomous lunar email agent
**Repo:** [`dm3n/sacred-secretion-agent`](https://github.com/dm3n/sacred-secretion-agent)
**Stack:** Next.js 16, React 19, Supabase, Resend, Vercel Cron, `astronomia`

A self‑running agent that computes the lunar cycle locally and dispatches phase‑specific guidance emails to subscribers each month — included here as a clean example of a **zero‑touch autonomous workflow**.

- **Local astronomical computation** (moon ecliptic longitude) with no external API — no rate limits, no latency.
- **Trigger‑based sequencing** — a multi‑email sequence fires at precise lunar‑phase transitions.
- **Daily Vercel cron** evaluates moon position for all subscribers and dispatches mail; fully automated from signup → delivery.

---

## Closers Edge App — operating system for a sales‑training program
**Repo:** `dm3n/closers-edge-app`
**Stack:** Next.js 16, React 19, Supabase (Auth + Postgres), TypeScript, Tailwind v4, shadcn/ui, Vitest

A role‑based dashboard unifying student onboarding, a job‑placement board, performance leaderboards, and admin analytics.

- **Three role portals** — public job board, authenticated student portal, PIN‑protected admin dashboard, each with distinct UI and data access.
- **Job board** with multi‑role filtering across curated high‑ticket sales roles.
- **Commission leaderboard** with real‑time ranking and a placement ledger.
- **Admin analytics** — pipeline funnel (Profile Complete → Interview Ready → Offer Matched), cohort metrics, and role breakdowns.

---

## Nassau — full‑stack golf e‑commerce platform, built from scratch
**Repo:** [`dm3n/nassau`](https://github.com/dm3n/nassau)
**Stack:** Next.js, Sanity (headless CMS), Stripe, Firebase, React Query, Tailwind + DaisyUI, Framer Motion

A complete, production‑grade e‑commerce store for golf — designed and built end‑to‑end, no template, no Shopify. It demonstrates full‑stack breadth well beyond AI work:

- **Headless commerce architecture** — a Sanity CMS backend models the entire catalog (products, variants, imagery, rich content via Portable Text), decoupled from the Next.js storefront.
- **Real payments** — full **Stripe** checkout integration (cart → session → payment), not a mock.
- **Backend & data** — Firebase for backend services; **React Query** for a robust client data/caching layer.
- **Premium product UX** — inner‑image zoom, pan/pinch, Swiper carousels, animated transitions (Framer Motion), toast notifications, confetti on purchase, and a scroll‑restoring SPA feel.

> Why it's here: it proves Daniel can architect and ship a complete commercial web application — CMS, payments, data layer, and polished UX — from a blank repo. The same full‑stack command underpins every AI platform in this portfolio.

---

### Also in the portfolio
- [`dm3n/human-divinity`](https://github.com/dm3n/human-divinity) — a second long‑form LaTeX research manuscript (interdisciplinary).
- [`dm3n/nodebase`](https://github.com/dm3n/nodebase) — full‑stack TypeScript application.
- [`dm3n/ratestore`](https://github.com/dm3n/ratestore) — TypeScript web app.
- [`dm3n/OpenCV`](https://github.com/dm3n/OpenCV) — real‑time hand‑tracking / computer‑vision in Python (early systems work showing range).
