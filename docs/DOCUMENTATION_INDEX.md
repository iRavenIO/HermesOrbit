# HermesMob Documentation Index

## Purpose

This directory is the investor-grade and build-grade documentation package for HermesMob: a native iOS control plane for Hermes Agent.

The package is designed to answer four questions convincingly:

1. **Why this product should exist**
2. **Why the market is real now**
3. **Why this team can ship it**
4. **Why the business can scale from self-hosted users to managed-hosted revenue**

## Package structure

### Core product and business
- `PRODUCT_BLUEPRINT.md` — master product thesis, system boundaries, parity targets, security, app review readiness
- `BUSINESS_PLAN.md` — business thesis, target segments, monetization direction, GTM framing
- `FEATURE_SYSTEM_AND_REQUIREMENTS.md` — structured feature inventory, launch tiers, requirements by surface
- `DELIVERY_ROADMAP.md` — release sequencing from MVP through hosted expansion

### Research and investor support
- `MARKET_LANDSCAPE.md` — category framing, demand signals, buyer segmentation, market forces
- `COMPETITIVE_LANDSCAPE.md` — competitive mapping, positioning, product gaps, differentiation
- `COMPETITOR_BENCHMARK_MATRIX.md` — side-by-side qualitative benchmark of adjacent products
- `INVESTOR_NARRATIVE.md` — concise investor story, moat framing, wedge, milestones, risks
- `COMMERCIAL_MODEL_APPENDIX.md` — monetization logic, wedge market framing, pricing bands, validation milestones
- `EVIDENCE_AND_ASSUMPTIONS_APPENDIX.md` — what is evidenced vs still assumed in the current package
- `RESEARCH_REFERENCES.md` — public sources, research scope notes, and interpretation caveats
- `APP_STORE_NAMING_RESEARCH.md` — naming and trademark-risk direction for public launch

### Technical and operational documentation
- `HERMES_PARITY_AUDIT.md` — map of known Hermes surfaces to mobile parity strategy
- `V1_SCOPE_DECISIONS.md` — canonical launch-scope decisions when other documents drift
- `MOBILE_API_CONTRACT_DRAFT.md` — contract direction for the mobile API façade
- `RISKS_AND_MITIGATIONS.md` — execution, product, security, review, and commercial risk register

## Recommended reading order

### For investors
1. `INVESTOR_NARRATIVE.md`
2. `MARKET_LANDSCAPE.md`
3. `COMPETITIVE_LANDSCAPE.md`
4. `BUSINESS_PLAN.md`
5. `DELIVERY_ROADMAP.md`

### For product and engineering
1. `PRODUCT_BLUEPRINT.md`
2. `V1_SCOPE_DECISIONS.md`
3. `FEATURE_SYSTEM_AND_REQUIREMENTS.md`
4. `HERMES_PARITY_AUDIT.md`
5. `MOBILE_API_CONTRACT_DRAFT.md`
6. `DELIVERY_ROADMAP.md`
7. `RISKS_AND_MITIGATIONS.md`

## Current thesis in one paragraph

HermesMob is not another AI chat app. It is a native iOS operator console for running, monitoring, and controlling Hermes Agent across self-hosted deployments first and future managed-hosted deployments later. The product wedge is mobile visibility, approvals, interventions, multi-instance control, and agent operations from anywhere. The commercial path starts with technical self-hosted users and expands into a hosted service where the same app becomes the customer control plane.

## Document quality standard

These documents are written to support:
- investor conversations
- internal product alignment
- implementation planning
- App Store readiness framing
- market and positioning discussions

## What this package does not yet prove

This package does not yet prove:
- live customer demand through interviews, pilots, or revenue
- final implementation timeline or staffing sufficiency
- production-grade hosted architecture readiness
- final legal clearance on naming or trademark use
- App Review approval certainty
- final API completeness across all Hermes deployment variants

## Known non-goals of this package

This package does not yet claim:
- final legal clearance on trademarks or Apple policy
- final design system visuals
- final API schemas for every endpoint and stream
- production security review sign-off
- simulator-tested application behavior

Those are downstream workstreams, not documentation failures.
