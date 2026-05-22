# HermesOrbit Documentation Program Spec

Date: 2026-05-21

## Summary

This spec expands the original HermesOrbit design work into an investor-grade and build-grade documentation program.

The operating assumption is:
- the user asked for a package strong enough to support serious investor conversations
- the package must also remain concrete enough to guide future implementation planning
- because the user did not respond to the audience-priority question within the waiting window, the default chosen here is **balanced investor-ready and build-ready documentation with investor-first narrative quality**

## Scope decomposition

The request is too broad for a single monolithic spec. It is decomposed into a documentation package with three layers.

### Layer 1 — Core product truth
Documents that define what the product is and what it must do:
- product blueprint
- feature system and requirements
- parity audit
- mobile API contract draft
- delivery roadmap

### Layer 2 — Commercial and investor truth
Documents that explain why the business should exist and why now:
- business plan
- market landscape
- competitive landscape
- investor narrative
- App Store naming research

### Layer 3 — Execution and trust truth
Documents that make the package credible rather than aspirational:
- risks and mitigations
- App Review framing inside product blueprint
- hosted-readiness constraints
- iOS scaffold proving the project has a real starting point

## Problem

The current HermesOrbit package was already credible as a product blueprint, but it still needed a more complete investor-facing layer:
- clearer market framing
- stronger competitive mapping
- more explicit feature inventory
- more explicit release roadmap
- a direct investor narrative
- a consolidated risk register

Without those documents, the package could support product discussion but not a high-confidence “this is a real company-building opportunity” discussion.

## Approaches considered

### Approach A — one giant master document
Pros:
- single file to hand to anyone

Cons:
- hard to navigate
- product, market, and engineering concerns get mixed together
- weak for maintenance and updates

### Approach B — investor-only pitch package
Pros:
- fast narrative clarity
- easier to make persuasive

Cons:
- weak build handoff
- easy to become hand-wavy
- lower implementation credibility

### Approach C — modular investor-grade documentation package
Pros:
- strongest credibility
- easy to hand different docs to different audiences
- easier to maintain as the project evolves
- preserves a clear bridge from research to product to build plan

Cons:
- more files to maintain
- requires a good index and reading order

### Recommendation

Choose **Approach C**.

That is now the active design.

## Decisions locked in

- product category: operator-grade iOS control plane for Hermes
- delivery sequence: self-hosted first, hosted-ready from day one
- MVP standard: all meaningful Hermes web/dashboard capabilities represented natively on iOS where mobile-safe and product-relevant
- package shape: modular documentation suite, not a single giant file
- investor stance: narrow but premium wedge is preferable to vague mass-market positioning
- naming direction: internal Hermes codename acceptable; public App Store brand should likely be independent

## Artifacts written or updated under this documentation program

### Existing foundation
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/PRODUCT_BLUEPRINT.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/BUSINESS_PLAN.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/APP_STORE_NAMING_RESEARCH.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/HERMES_PARITY_AUDIT.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/MOBILE_API_CONTRACT_DRAFT.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/ios/HermesOrbit.xcodeproj`

### New package additions
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/DOCUMENTATION_INDEX.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/MARKET_LANDSCAPE.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/COMPETITIVE_LANDSCAPE.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/COMPETITOR_BENCHMARK_MATRIX.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/FEATURE_SYSTEM_AND_REQUIREMENTS.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/DELIVERY_ROADMAP.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/INVESTOR_NARRATIVE.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/RISKS_AND_MITIGATIONS.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/COMMERCIAL_MODEL_APPENDIX.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/EVIDENCE_AND_ASSUMPTIONS_APPENDIX.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/RESEARCH_REFERENCES.md`
- `/Users/kousha/Sites/Local/Applications/HermesMob/docs/V1_SCOPE_DECISIONS.md`

## Current confidence statement

The package is now strong enough for:
- investor narrative conversations
- internal alignment
- implementation-planning preparation

It is still not the same as:
- customer-validation proof
- final hosted architecture sign-off
- final implementation estimate
- final legal/App Review guarantee

That limitation is now explicit in the documentation rather than hidden.

## Approval criteria

This documentation program should be considered approved if the user agrees that HermesOrbit should now be documented as:

1. a serious operator-grade mobile product, not a simple chat wrapper
2. a business that starts with self-hosted power users and expands toward hosted service
3. a modular investor-ready package with separate market, product, competitive, and risk artifacts
4. a public launch that likely avoids `Hermes` as the primary App Store brand

## Review standard

A successful review of this package should conclude:
- the opportunity is legible
- the product wedge is specific
- the market story is not hand-wavy
- the feature system is concrete
- the roadmap is plausible
- the risks are named rather than hidden

## Next planning step

After user review of the documentation package, the next step should be the full implementation plan package covering:
1. mobile app architecture
2. API façade schema and stream design
3. push and approval pipeline
4. exact screen-by-screen implementation plan
5. hosted identity, tenancy, and entitlement roadmap
