# Research: From Reading to Writing the Genome

> **Single-author paper.** Daniel Ray Edgar, June 2026.
> Repository: [`dm3n/ai-designed-life`](https://github.com/dm3n/ai-designed-life) · written in LaTeX.

This is a third piece of original, independent research: a paper arguing that molecular biology is inverting from a *reading* science, one organized around sequencing, imaging, and annotating what nature already wrote, into a *writing* science, an engineering discipline in which generative models propose biological designs, automated foundries build and test them, and the results feed back to improve the next proposal. Where the [uncertainty-propagation paper](01-research-uncertainty-propagation.md) formalizes the reliability of agentic reasoning and the [Information-Maintenance Hypothesis](09-research-information-maintenance.md) treats information as the substrate of life, mind, and markets, this paper applies the same first-principles habit to a concrete and fast-moving field: where AI-driven biological design actually is, and where it is not.

---

## 1. The thesis

The binding constraint on biological design was never our ability to *read* biology; it was our inability to *search* its astronomically large design space, and that is exactly the constraint modern generative models relax. A protein of 100 residues lives in a space of `20^100 ≈ 10^130` possibilities; evolution and the laboratory have together sampled a vanishingly thin thread of it. Directed evolution is local hill-climbing on that space; a generative model converts blind enumeration into guided sampling, which is the only operation that makes the space navigable at all.

## 2. The accounting spine: cost per validated design

The paper tracks a single quantity, stated as an accounting identity rather than dressed up as a theorem:

```
CVD = (c_design + c_build + c_test) / p
```

where `p` is the experimental hit rate. The placement of `p` is the whole point: because it sits in the denominator, raising the hit rate acts *multiplicatively* on the entire cost of a validated design, whereas a cheaper proposal step only reduces one term in the numerator. This locates the leverage of artificial intelligence precisely: its largest effect arrives not as a cheaper idea but as a higher chance that the built-and-tested idea works.

## 3. What actually works, by arm of the cycle

- **Reading** is essentially solved at the scale of proteins: AlphaFold and ESMFold predict structure at experimental accuracy, with a database of over 214 million predicted structures, approximately the entire catalogued protein universe.
- **Writing** is the genuinely new development: RFdiffusion designs novel protein backbones and binders, ProteinMPNN designs sequences for them, and de novo enzymes (designed luciferases) have been built and confirmed in the laboratory. These are proteins evolution never made, designed to specification and shown to work.
- **Generating** now reaches genome scale: Evo and Evo 2 write coherent nucleic-acid sequence from the single gene up to roughly a megabase of context, trained across all domains of life.
- **Installing** the output is routine: CRISPR for cutting, base and prime editing for precise rewriting.

## 4. The ceiling, stated honestly

The load-bearing limitation, and the part the hype omits, is that **we can increasingly design molecules but we cannot design organisms.** Molecules have clean specifications, clean tests, and abundant training data. Organisms have none of these: their genotype-to-phenotype map is entangled (epistasis, pleiotropy), developmental (a genome is a program run over time, not a blueprint), emergent across scales, and starved of the labeled phenotype data that made the molecular models possible. The clearest evidence is that even the minimal bacterial genome JCVI-syn3.0, stripped to 473 genes, still contains 149 genes of unknown function: we can synthesize a genome and autocomplete one, but we cannot yet author one. The cinematic premise of combining species' traits in a single organism is shown to have no real pathway, for exactly these reasons.

## 5. The predictions and the governance problem

The paper closes with **six falsifiable predictions**, five expressing the thesis that molecular design is on a compounding cost curve (continued cost decline, a de novo-designed therapeutic in the clinic, closed-loop lab throughput, validated genome-scale design, and the hit-rate term dominating the gains) and one deliberately **negative** prediction that pins the ceiling: no de novo, designed-body-plan multicellular organism by 2035. It then treats the dual-use problem directly, since a general-purpose tool for designing biological function is the same capability whether pointed at therapeutics or at harm, and maps the governance response onto the design, build, and test arms of the cycle.

## 6. Why this belongs in the portfolio

This is a third single-author research artifact, and it demonstrates the same capability the rest of this portfolio shows in production: taking a hard, fast-moving, hype-saturated question and modeling it from first principles, from a clean accounting identity to a survey of verified evidence to a set of falsifiable, dated predictions, while being explicit about the line between what is demonstrated and what is aspiration. It is also evidence of range: the same rigor applied to LLM reasoning reliability and to information theory, now applied to the frontier where AI meets biology.

> Bottom line: a self-taught founder authored a third independent research paper, identified the actual binding constraint in AI-driven biological design (search, not reading), reduced the field's economics to a single accounting identity, separated demonstrated molecular results from the organism-scale ceiling the hype elides, and committed to six dated, falsifiable predictions including one designed to embarrass the optimistic reading.
