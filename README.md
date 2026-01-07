# The Unfaithful Cut: A Structural Diagnostic for Algebraically Closed Reductions
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.18168369.svg)](https://doi.org/10.5281/zenodo.18168369)

**Author:** A. R. Wells  
**Affiliation:** Dual-Frame Research Group  
**License:** CC BY 4.0  
**Contact:** No solicitation for correspondence or media contact  
**Paper email:** arwells.research@proton.me  

---

## Overview

This repository contains the LaTeX source for the foundations paper  
**_The Unfaithful Cut: A Structural Diagnostic for Algebraically Closed Reductions_**.

The paper introduces a diagnostic framework for identifying when **reduced descriptions**
(states, channels, or static multi-time process tensors) are **structurally incapable**
of supporting counterfactual prediction under physical interventions.

The central claim is representational, not dynamical:

> Some many-to-one operational reductions identify distinct physical histories
> that support different admissible continuations under intervention.
> In such cases, no evolution rule defined solely on the reduced object
> can support counterfactual reasoning.

This failure mode is termed the **unfaithful cut**.

---

## What the Unfaithful Cut Is

The unfaithful cut arises when an operational reduction discards distinctions that later
become causally relevant under a specified class of interventions.

- **Σ₁ descriptions** treat algebraically closed objects as sufficient  
  (instantaneous states, channels, or static process tensors).
- **Σ₂ descriptions** make explicit the trajectory-level admissibility structure
  required to support counterfactual prediction.

The paper formalizes:
- faithfulness with respect to interventions
- continuation-equivalence and fiber structure
- Σ₁ vs Σ₂ as representational categories

Σ₂ is introduced not as a new dynamics, but as the minimal representational structure
any faithful reduced description must encode.

---

## What This Paper Demonstrates

The paper establishes three core results:

1. **Structural unfaithfulness of algebraic closure**  
   Under physically standard conditions (e.g. correlations with discarded degrees of
   freedom and intervention classes including free evolution), Σ₁ descriptions can fail
   to be faithful. This failure is representational and cannot be repaired by modifying
   reduced equations of motion alone.

2. **Minimal faithful structure (Σ₂)**  
   The paper defines a trajectory-level admissibility geometry (Σ₂) and shows that it
   encodes the minimal information required to restore counterfactual semantics.
   This minimality is representational, not computational.

3. **Unifying diagnostic perspective**  
   The unfaithful cut provides a common structural explanation for phenomena appearing
   across open quantum systems, quantum control, process-tensor formalisms, contextuality,
   and causal modeling.

---

## What This Paper Does *Not* Claim

- It does **not** modify quantum mechanics
- It does **not** introduce new microscopic dynamics
- It does **not** propose hidden-variable ontologies
- It does **not** claim Σ₂ is universal or computationally efficient
- It does **not** replace non-Markovian or process-theoretic models

Instead, it clarifies when and why such models succeed or fail, by diagnosing the
structural adequacy of the underlying operational reduction.

---

## Relation to Dual-Frame Theory (DFT)

This work is part of the broader **Dual-Frame Theory (DFT)** research program, but it is
**logically independent** of any specific DFT dynamical claims.

- DFT: geometry-first account of physical structure
- Unfaithful Cut / Σ₂: representational and diagnostic analysis of reductions

The results of this paper stand on their own as a contribution to quantum foundations,
open systems, and control theory.

---

## Repository Contents

- `unfaithful_cut_foundations.tex` — master LaTeX source
- `sections/` — individual paper sections
- `appendices/` — worked examples and technical details
- `bib/references.bib` — bibliography
- `figures/` — figures and diagrams
- `tools/` — helper scripts

Key appendix:
- **Appendix A** — worked example demonstrating explicit unfaithfulness
  under unitary system–environment evolution

---

## Build Instructions

**Requirements:** `latexmk` with a standard LaTeX installation.

Build the PDF:

    latexmk -pdf -interaction=nonstopmode -halt-on-error unfaithful_cut_foundations.tex

Clean build artifacts:

    latexmk -C

---

## Status

- Conceptual framework finalized
- Formal definitions complete
- Explicit quantum and classical examples included
- Minimality clarified as representational
- Referee-reviewed and accepted with minor revisions

**Release:** Published on Zenodo (versioned)

- **Version v1 DOI:** https://doi.org/10.5281/zenodo.18168370  
- **All versions DOI:** https://doi.org/10.5281/zenodo.18168369  

---

## Citation

If you use or reference this work, please cite the Zenodo record corresponding to
the version used.

**Recommended citation (v1):**

A. R. Wells (2026).  
*The Unfaithful Cut: A Structural Diagnostic for Algebraically Closed Reductions* (v1).  
Zenodo. https://doi.org/10.5281/zenodo.18168370

For citation independent of version, use the **all-versions DOI**:  
https://doi.org/10.5281/zenodo.18168369

This work is released under **Creative Commons Attribution 4.0 (CC BY 4.0)**.