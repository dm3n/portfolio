# The Engineering OS — "Macintosh"

> **Repository:** [`dm3n/macintosh`](https://github.com/dm3n/macintosh) (public)

Most engineers build products. Daniel also built **the system that builds the products** — a complete, self‑hosted "engineering operating system" that runs a multi‑agent software pipeline, a persistent knowledge brain, and a 24/7 home‑lab cluster. It is the personal infrastructure behind the velocity demonstrated across this portfolio (multiple shipped platforms, a research paper, and Symphony — built largely solo).

This is itself evidence of extraordinary ability: the meta‑skill of designing the tooling, automation, and AI‑agent workflows that make one person operate like a team.

## What it is
A reproducible macOS + Claude Code setup, plus a self‑hosted homelab, organized into clear layers:

- **A 6‑stage agentic coding pipeline** — Plan → Code → Test → QA → Review → Ship — implemented as a set of custom Claude Code **skills** (`product-review`, `autoplan`, `design-review`, `qa`, `cso`, `canary`, `document-release`, `retro`, and more) layered on top of the open‑source *Superpowers* discipline (brainstorming → writing‑plans → execution → TDD → code‑review → verification).
- **A unified multi‑agent setup** — Claude Code, Codex CLI, Gemini CLI, and OpenCode all share the same system context and the same Superpowers baseline, so any agent can pick up work with consistent standards.
- **A Personal Knowledge Brain (PKB)** — an Obsidian vault with a compiler pipeline: raw sources (`Brain/Raw/`) are processed by an LLM into structured Wiki entities, concepts, and SOPs (`Brain/Wiki/`), queryable via a cross‑Brain Q&A tool. Persistent memory survives across every AI model and session.
- **A self‑hosted homelab** — a Proxmox cluster running a Docker stack (orchestrator, MCP gateway, approval gateway, domain agents, Postgres, Redis), with a **Kali VM as a first‑class AI & security node** and GCP offload for model serving.
- **A human‑gated approval model** — every agent output is a *pending action*; nothing is delivered until it is explicitly approved, with an auditable trail.

## Architecture at a glance
```
Build pipeline (6 stages, skill-driven)   ─┐
Persistent knowledge brain (PKB/Obsidian) ─┤→  one founder operating like a team
Private homelab (Proxmox + Docker + Kali) ─┤
Human-gated approval + audit trail        ─┘
   on top of: Claude Code · Codex · Gemini · OpenCode  (shared context + Superpowers)
```

## Why it counts as evidence
The macintosh repo is public, real, and used daily. It demonstrates not just *using* AI tools but **architecting an integrated AI‑agent operating environment** — the same systems‑level thinking that produced Symphony, applied to Daniel's own engineering practice. It is the connective tissue that explains how the breadth of work in this portfolio was produced.

*The repository is actively maintained; see its README and `docs/` for the full system bird's‑eye view, the homelab architecture, the knowledge‑brain design, and the skills reference.*
