# Research: Uncertainty Propagation in Tree-Structured Language Model Reasoning

> **Single-author paper.** Daniel Ray Edgar, March 5, 2026.
> Repository: [`dm3n/uncertainty-propagation`](https://github.com/dm3n/uncertainty-propagation) · written in LaTeX.

This is original, independent research that derives, from first principles, how small per‑step errors compound across multi‑step LLM reasoning, proves when *tree‑structured* reasoning escapes that decay, and validates the entire framework empirically against four frontier models. It is the theoretical backbone behind the production agentic systems documented elsewhere in this portfolio: the same exponential‑decay phenomenon the paper formalizes is exactly what the **Symphony** runner and the Airbank/Finsider agents are engineered to defeat.

---

## 1. The question

While building systems that use language models for multi‑step financial analysis, I kept hitting the same wall: accuracy degraded badly as tasks got longer, *even when every individual step looked fine*. The instinct is to call it a prompting problem. It isn't. It's structural, and the literature on chain‑of‑thought, self‑consistency, and tree‑of‑thought is implicitly *about* this problem but almost never writes down the underlying probabilistic structure explicitly.

The motivating calculation is embarrassingly simple and is the whole point: if a model has a 10% chance of getting any single step wrong, asking it to do ten steps gives `0.9^10 ≈ 35%` end‑to‑end success. No fancy reasoning required, just a product of probabilities.

## 2. The Reasoning Tree Model (RTM)

The paper introduces a clean probabilistic model:

- Each reasoning step `sᵢ` is a Bernoulli trial with a **step‑specific failure probability** `θᵢ`.
- Steps are assumed conditionally independent given the query (an idealization the paper *tests and defends* empirically rather than assuming away).
- A **reasoning chain** `Cₙ` is a path `s₁ → … → sₙ → a`, correct iff all `n` steps are correct.
- A **reasoning tree** `T_{k,d}` is a balanced `k`‑ary tree of depth `d`; each internal node spawns `k` continuation branches, leaves produce candidate answers, and a **majority vote** aggregator picks the plurality.

This single model unifies three previously separate techniques as special cases:

| Technique | RTM form |
|---|---|
| Standard chain‑of‑thought | `Cₙ` |
| Self‑consistency (k samples + majority vote) | `T_{k,1}` (depth‑1 tree) |
| Tree‑of‑thought (value‑guided search) | `T_{k,d}`, `d ≥ 2` |

## 3. Core theoretical results

**Chain success (Theorem 3.1).** Under the RTM, `P(correct | Cₙ, θ) = ∏ᵢ(1 − θᵢ)`.

**Exponential decay (Corollary 3.2).** `P(correct) ≤ (1 − θ̄)ⁿ ≤ e^(−nθ̄)`: decay is a *direct consequence of the product structure*, not an emergent mystery.

**Which step matters most (Proposition 3.4).** Counterintuitively, sensitivity `Sᵢ = ∏_{j≠i}(1−θⱼ)` is **larger for the steps that are already good** (low `θ`). The marginal value of improvement concentrates on near‑correct steps, not the worst one.

**Heterogeneity penalty (Proposition 3.5).** Real per‑step error profiles are far from uniform (step‑1 framing errors ≈ 2–5%; final calculation steps routinely exceed 20–30% on MATH). Heterogeneous profiles are shown to be *somewhat less* harmful than uniform ones at the same mean, but they concentrate risk in identifiable bottleneck positions, which is operationally useful.

**Tree majority vote (Theorem 4.1 / 4.2).** For a `k`‑ary depth‑`d` tree with leaf success `p = (1−θ)^d`, majority vote converges to 1 as the number of leaves grows **iff `p > 1/2`** (i.e. `d < log2 / |log(1−θ)|`). Crucially, failure probability decays as `exp(−Ω(N^{1−1/(d+1)}))` in total compute `N`, **strictly sub‑exponential**, a qualitatively different reliability regime than the chain's `≈ e^(−Nθ)`.

**Optimal branching (Theorem 4.3).** Closed‑form approximations for the compute‑optimal `(k*, d*)`. For modern models (`θ ≈ 0.08–0.15` on hard problems), the optimum is **shallow** (depth 2–3, branching 3–5), not the deep expansive search tree‑of‑thought papers often imply.

**Estimation (Theorems 5.1–5.2).** The MLE for step failure rates is just the empirical error rate `θ̂ᵢ = eᵢ/nᵢ`; the interesting part is propagating that estimation uncertainty through the product via the **delta method** to get confidence intervals on end‑to‑end success.

**Algorithm 1 (RTM Fit‑and‑Select):** given an annotated dataset and a compute budget `N`, fit `θ̂`, then select the reasoning topology (chain vs. tree shape) that maximizes predicted success, a practical recipe for choosing how to spend inference compute.

## 4. Empirical validation

The framework was tested against **four frontier models** (GPT‑5, Claude Opus 4.6, Claude Sonnet 4.6, and Gemini 3.1 Pro) across **GSM8K, MATH, and MMLU‑Pro**. Step‑level labels came from a process reward model (Llama 3.1 8B fine‑tuned on PRM800K; 91.8% agreement with human annotators).

Headline findings:

- **Predictions track reality to within ~1% mean absolute error** across all twelve (model, benchmark) combinations, roughly **4–8× tighter** than the uniform‑`θ` baseline.
- **95% confidence‑interval coverage** lands at the nominal level (93.5–95.2%) throughout.
- The signature result: at a fixed budget of **N = 48 steps** on MATH (Claude Sonnet 4.6, `θ̄ ≈ 0.12`), a **48‑step chain achieves ≈ 0.2% success**, while a **depth‑3 tree using the same 48 steps achieves 97.9%**. *Same compute, rearranged: the difference between a system that works and one that doesn't.*
- Even GPT‑5, the strongest model tested, only reaches ≈ 29% success on a 12‑step MATH chain.
- The independence assumption holds up: median pairwise step correlation `|ρ̂| < 0.04`.

## 5. Why this matters for the rest of this portfolio

This paper is not an academic detour: it is the **design theory** for everything else here:

- It explains *why* naive long‑chain agents silently fail on real financial workflows, and *why* the production systems in this portfolio decompose work into short, verified, tree‑structured units with majority/critic aggregation rather than one long chain.
- The **Symphony** runner's preflight scoping, acceptance contracts, and adversarial review‑critic loop are, in effect, an engineering instantiation of "keep `θ` low per step and aggregate across branches."
- The Airbank QoE engine's **section‑by‑section extraction with confidence flags** is the heterogeneous‑`θ` insight applied to document AI: surface the high‑`θ` bottleneck steps for human verification instead of trusting one long pass.

> Bottom line: a self‑taught founder independently formalized a problem the frontier‑model field discusses constantly but rarely states precisely, proved the governing results, and confirmed them against the newest models available, then shipped systems built on those results into production.
