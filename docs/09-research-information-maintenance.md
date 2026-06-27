# Research: The Information-Maintenance Hypothesis

> **Single-author paper.** Daniel Ray Edgar, June 2026.
> Repository: [`dm3n/information-maintenance-hypothesis`](https://github.com/dm3n/information-maintenance-hypothesis) · written in LaTeX.

This is a second piece of original, independent research: a theory paper arguing that three problems usually treated as unrelated, why organisms age, what intelligence is, and how markets price the world, are the same problem viewed three ways. Each is a system that maintains a low-entropy, predictive structure against a noisy environment, and each pays for it in the same currency, free energy spent to keep information accurate. Where the [uncertainty-propagation paper](01-research-uncertainty-propagation.md) formalizes the *reliability* of agentic reasoning, this paper steps back to a broader thesis about information itself as the substrate of life, mind, and markets.

---

## 1. The thesis

Life, mind, and money are three instantiations of one problem: holding a predictive model together against the second law of thermodynamics. The paper is disciplined about a distinction that runs through it, the difference between a bridge that is a **theorem** and a bridge that is a **structural analogy**, and it rests on two results that are theorems, not metaphors.

## 2. The two anchoring theorems

**Landauer's principle.** Erasing or maintaining one bit of information against thermal noise costs at least `k_B T ln 2` of dissipated energy. This puts a real, physical, laboratory-confirmed price tag on every model any system keeps. Maintaining accuracy is never free.

**The Kelly–Cover identity.** The long-run exponential growth rate of capital obtainable from a signal equals the mutual information between that signal and the future, `ΔW = I(X;Y)`, with equality in a fair (horse-race) market and an upper bound in general. Capital growth is, literally, measured in bits. A one-bit information edge per bet is a doubling of capital per bet. The paper proves the horse-race case from first principles in an appendix.

Two of the three bridges (mind and money) are exact theorems; the third (biology) is an honestly-flagged structural correspondence backed by genuinely information-theoretic measurements.

## 3. The three pillars

- **Life: aging as information loss.** Aging is accompanied by a measurable increase in epigenetic and transcriptional entropy (literal Shannon entropy), and because the digital genome is preserved, partial reprogramming can recover the lost analog information, error-correction against a backup. Aging reframed as a recoverable information-maintenance failure.
- **Mind: intelligence as compression.** A language model's cross-entropy loss *is* the bit-length of what it compresses (an exact equality, not a metaphor); scaling laws are empirical compression curves; the brain's predictive coding is the same principle. Intelligence is the work of building a maximally compressed predictive model and not paying to carry anything else.
- **Money: markets as information aggregation.** Prices compress dispersed private knowledge (Hayek); markets are necessarily lossy compressors that must leave residual exploitable information to fund their own computation (Grossman–Stiglitz); and capital growth equals an information rate (Kelly–Cover).

## 4. The unification and the predictions

The paper states a single **maintenance inequality**: a system persists only while it can reduce its model's divergence from the environment fast enough to outrun entropy, at a free-energy cost bounded below by Landauer. It then makes **eleven falsifiable predictions** across biology (biological-age reset, the reprogramming ceiling), AI (compression as the intelligence metric, energy as the binding constraint), and finance (the collapse of human information edges, capital repriced as predictive accuracy), converging on a single claim: **negentropy**, the capacity to acquire free energy and spend it maintaining an accurate model, is the scarce resource that life, mind, and money all compete for.

## 5. Why this belongs in the portfolio

This is a second single-author research artifact demonstrating the same capability the rest of this portfolio shows in production: taking a hard, open question and modeling it from first principles, from formal definition to proven theorem to falsifiable prediction. It is the conceptual companion to the uncertainty-propagation paper, both are evidence of original contribution: one formalizes how to make autonomous reasoning reliable, the other formalizes what information *is* across the systems I build on.

> Bottom line: a self-taught founder authored a second independent theory paper, identified the two theorems that actually connect biology, intelligence, and finance, was explicit about where the unification is proven versus analogical, and committed to eleven testable predictions, the same first-principles rigor, applied to a much larger question.
