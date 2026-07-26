# Research: The Embodied Agency Hypothesis

> **Single-author paper.** Daniel Ray Edgar, July 2026.
> Repository: [`dm3n/embodied-agency-hypothesis`](https://github.com/dm3n/embodied-agency-hypothesis) · 26 pages · written in LaTeX.

This is a fourth piece of original, independent research. It begins with a thesis
usually presented as a mixture of physiology, quantum language, manifestation, and
spiritual tradition: the state of the human body changes the reality a person can
access. The paper recovers the strongest defensible version of that idea, formalizes
it, and submits every factual claim to an explicit evidence ladder.

The result is neither a credulous quantum manifesto nor a pure debunking exercise. It
is a causal model of embodied agency, supported by research on bioelectric signaling,
sleep, circadian state, metabolism, inflammation, food environments, attention,
habits, expectation, imagery, implementation intentions, and contemplative practice.
The paper then states exactly where the evidence ends.

## 1. The thesis

The paper distinguishes three meanings of reality:

- **Ontic reality:** the world that exists independently of an agent's present
  experience.
- **Lived reality:** the subset of the world perceived, modeled, valued, and
  experienced by that agent.
- **Enacted future:** a later world state whose probability has been changed by the
  agent's actions.

Manifestation is defended in the third sense and partly in the second. Intention
changes attention and policy selection. Biological state constrains which policies can
be represented and reliably executed. Action changes the environment. Feedback updates
the next cycle. The mind is powerful because, through a living body, it enters
causality.

## 2. The formal contribution

For biological state `B_t`, environment `E_t`, execution threshold `rho`, and outcome
threshold `epsilon`, the paper defines an executable policy set and the accessible
future set:

```text
A_{epsilon,rho}(B_t,E_t)
=
{ y : there exists pi in Pi_rho(B_t,E_t)
      such that P(y | do(pi), B_t, E_t) >= epsilon }.
```

Intention changes future probabilities through policy selection:

```text
P(Y | I_t, B_t, E_t)
=
sum over pi [
  P(Y | do(pi), B_t, E_t) P(pi | I_t, B_t, E_t)
].
```

The placement of each term is the thesis. Intention changes policy weights. Biology
and environment constrain the support. Action carries the effect into the world.

The paper proves two propositions inside this model:

1. **Mediator requirement.** When policy and downstream action are fixed, intention
   does not change an external outcome under the ordinary causal graph.
2. **Biological contraction.** Under stated assumptions, if an impaired biological
   state removes executable policies, its accessible future set contracts.

The mediator requirement is also a refutation condition. A reproducible effect of
intention on a properly isolated external random process would falsify the ordinary
graph and require a new mechanism.

## 3. The evidence ladder

Every major assertion is classified as:

- **Established:** mature physical theory or replicated causal evidence.
- **Supported:** convergent evidence with material limits.
- **Plausible:** a testable extrapolation not yet established.
- **Interpretive:** phenomenological, philosophical, or theological meaning rather
  than a laboratory result.

This structure permits scientific and spiritual material to remain in one paper
without being confused. Molecular quantum effects are established in specified
biological reactions. A quantum cognitive computer is not. Kundalini and theosis are
real textual and experiential traditions. A universal monthly cerebrospinal secretion
is not established anatomy.

## 4. Direct audit of the source claims

The paper audits, with adjacent citations, claims concerning:

- linguistic-wave genetics and semantic DNA programming;
- DNA charge transport and the false code-versus-antenna dichotomy;
- the heart's measurable picotesla magnetic field and the unsupported privileged
  three-foot boundary;
- human cell-count and neural-voltage numbers presented with false precision;
- incompatible estimates of a whole-human processing rate;
- molecular tunneling versus quantum cognition and timeline selection;
- sleep, circadian disruption, hydration, inflammation, processed food, and the
  gut-brain axis;
- notifications, habits, recommendation systems, and commercial incentives;
- placebo mechanisms, motor imagery, implementation intentions, and meditation;
- alchemy, kundalini, Christian theosis, Christ consciousness, pineal DMT, and the
  sacred-secretion claim.

Two public records receive special documentary analysis. U.S. Patent 6,506,148 B2
claims a low-frequency monitor-emission method, but its specification describes
subject-controlled observations and a subjective eyelid-ptosis response rather than a
blinded, independently replicated trial. The 1983 U.S. Army memorandum *Analysis and
Assessment of Gateway Process*, later released under a CIA archive number, shows
institutional interest and proposes future experiments. Declassification establishes
provenance and release status, not successful experimental validation.

The exact patent and Gateway PDFs are archived in the paper repository with SHA-256
hashes so the document-type argument is auditable.

## 5. Falsifiable predictions

The paper closes with seven predictions:

1. Restoring disrupted sleep and circadian timing will expand measured policy
   generation, feedback updating, and execution reliability for defined tasks.
2. Implementation intentions plus environmental cue design will outperform outcome
   visualization alone, with external effects mediated by action.
3. Context changes and notification removal will reopen intentional control most for
   people whose baseline behavior is cue-driven.
4. Information-rate estimates will vary by orders of magnitude across sensory,
   neural, motor, report, and behavioral levels, defeating a context-free global
   bitrate.
5. Semantic DNA programming will fail a blinded, multilaboratory test unless a
   meaning-specific effect survives energy matching, translation, sham exposure, and
   raw-data release.
6. Longitudinal measurement will not reveal the asserted universal monthly
   brain-to-sacrum-to-brain secretion cycle.
7. Contemplative practice will change selected attention, regulation, and
   self-transcendence measures through measurable mediators, but will not reliably
   affect shielded random physical outcomes.

Several are deliberately negative. They mark the boundary of the theory and create
clear ways for future evidence to prove it wrong.

## 6. Why this belongs in the portfolio

The paper demonstrates the same first-principles behavior present across Daniel's
technical work: begin with an emotionally charged, hype-saturated problem; separate
measurement from model and interpretation; define the mechanism mathematically; expose
the model to counterarguments; and commit to observations that could falsify it.

It also demonstrates range. The first paper models reliability in language-model
reasoning. The second develops an information-theoretic synthesis across aging,
intelligence, and markets. The third analyzes the economics and limits of AI biological
design. The fourth joins bioelectric regulation, cognitive state, agency, and spiritual
interpretation while refusing to claim more than the evidence permits.

> Bottom line: a self-taught founder authored a fourth independent research paper,
> formalized the relationship between biological state and reachable futures, proved
> two propositions, audited 56 scientific and documentary sources, preserved a serious
> account of manifestation and human divinity without presenting unsupported mechanisms
> as facts, and committed the theory to seven falsifiable predictions.
