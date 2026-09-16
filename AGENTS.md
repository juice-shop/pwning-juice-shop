# Agent Operating Guidelines (AGENTS.md)

This document establishes the repository-wide operational rules, architectural facts, change boundaries, and governance protocols for AI agents working in `pwning-juice-shop`.

---

## 1. Guidance Layering & Precedence

When multiple instructions or guidance documents apply to a task, resolve conflicts using the following strict hierarchy (highest precedence first):

1. **Active Prompt Instructions**: Specific scopes, constraints, or overrides explicitly stated in the active user prompt.
2. **Repository Checklists & Templates**: Quality gating documents and structural boilerplates:
   - `.ai/challenge-maintenance/checklists/challenge_verification.md`
   - `.ai/challenge-maintenance/templates/new_challenge_section.adoc`
3. **Domain-Specific Agent Skills**: Specialized workflow guidance located in `.ai/`:
   - `.ai/challenge-maintenance/SKILL.md` (challenge lifecycle, data synchronization, and mutation protocols)
   - `.ai/challenge-documentation/SKILL.md` (AsciiDoc layout, table architecture, and formatting conventions)
4. **Repository Agent Guidelines (`AGENTS.md`)**: This document (foundational operating rules, canonical source handling, change boundaries, and ambiguity protocols).
5. **Human Contributor Docs**: `CONTRIBUTING.md` and `README.md`.

---

## 2. Canonical Sources of Truth & External Authorities

- **Challenge Definitions**: `docs/modules/ROOT/assets/data/challenges.yml` is the sole authoritative source of truth for all challenge metadata (keys, names, categories, descriptions, difficulties, hints, and tags). Documentation prose expands upon this data for educational purposes but must never contradict it.
- **Upstream Alignment**: Challenge specifications reflect official upstream releases of the OWASP Juice Shop application. When documentation prose and `challenges.yml` disagree, `challenges.yml` takes absolute precedence.
- **Site Navigation & Structure**: `docs/modules/ROOT/nav.adoc` (Antora web navigation) and `docs/modules/ROOT/book.adoc` (PDF/eBook structure) define the canonical hierarchy of book chapters and sections.

---

## 3. Repository Facts & Conventions

Agents modifying content in this repository must strictly adhere to the following architectural and formatting standards:

- **Component Architecture**: Documentation is authored in AsciiDoc (`.adoc`) organized for Antora (`docs/antora.yml`, `docs/modules/ROOT/`).
- **Alphabetical Ordering**: Strict alphabetical sorting by challenge `Name` is mandatory across:
  - Master challenge tables in `docs/modules/ROOT/pages/part2/README.adoc` (both CTF and Normal mode tables).
  - Category chapter summary tables in `docs/modules/ROOT/pages/part2/<category>.adoc`.
  - Solution subsections in `docs/modules/ROOT/pages/appendix/solutions.adoc` (alphabetical within each difficulty tier).
  - Tag listings in `docs/modules/ROOT/pages/part1/challenges.adoc`.
- **Difficulty Ratings**: Challenge difficulty is represented with star emojis from ⭐ (1 star) to ⭐⭐⭐⭐⭐⭐ (6 stars).
- **Anchor Standard**: Section anchors must be placed immediately above headers using the format `[[_{anchor_name}]]`, where `{anchor_name}` is lowercase, special characters are removed, and spaces are replaced with underscores (e.g., `[[_access_a_confidential_document]]`).
- **Cross-Reference Links**:
  - Hint links: `xref:part2/<category>.adoc#_{anchor_name}[💡]`
  - Solution links: `xref:appendix/solutions.adoc#_{anchor_name}[📕]`
  - Internal intra-document references: `<<_anchor_name,Display Text>>`

---

## 4. Explicit Change Boundaries

To maintain repository integrity and prevent build breaks or CI pipeline conflicts, agents must observe strict change boundaries.

### Permitted Modifications
- Modifying target chapter pages in `docs/modules/ROOT/pages/` (specifically `part2/README.adoc`, `part2/<category>.adoc`, `appendix/solutions.adoc`, and `part1/challenges.adoc`).
- Updating agent governance files (`AGENTS.md`, `.ai/**`).
- Updating `challenges.yml` only when explicitly instructed by the user.

### Strictly Prohibited Modifications
- **Hint Partials (`docs/modules/ROOT/partials/hints/*.adoc`)**: AI agents MUST NEVER create, edit, or delete files in this directory. These files are generated and synchronized exclusively by `./partializeHints.sh` via the `.github/workflows/partialize_hints.yml` CI workflow.
- **Score Board Challenge**: The Score Board challenge (`scoreBoardChallenge`) has no hints and must NEVER have a hint partial file, an `include::` directive, or hint references.
- **Build & CI Infrastructure**: Do NOT modify `antora-playbook.yml`, `docs/antora.yml`, `package.json`, `package-lock.json`, or `.github/workflows/*` unless the task is explicitly focused on build/CI maintenance.
- **Unrelated Chapters**: Do NOT modify non-challenge chapters (`introduction/`, `part1/` non-tag sections, `part3/`, `part4/`, `part5/`) unless explicitly requested.

---

## 5. Scoping of Automated Updates

- **Atomic Modifications**: Keep changes tightly focused on the specific challenges or topics identified in the task. Avoid unnecessary sweeps, whitespace churn, or unsolicited refactoring of adjacent content.
- **Categorical Processing**: When executing multi-challenge synchronization or updates, process changes systematically category-by-category to keep diffs reviewable and coherent.
- **Minimal Diffs**: Preserve existing prose, surrounding AsciiDoc attributes, and section ordering unless a specific correction is warranted by `challenges.yml`.

---

## 6. Handling Ambiguity, Missing Facts & Schema Deviations

Agents must follow strict fallback protocols when encountering missing data or ambiguous requirements:

- **Missing Solution Steps**: Never fabricate exploit payloads, fake credentials, or fictitious walkthrough steps. If concrete verified steps are unavailable, use the standard placeholder:
  `// TODO Add solution for {challengeKey}`
- **Missing Hint Partials on Disk**: If `docs/modules/ROOT/partials/hints/{challengeKey}.adoc` does not yet exist, do not generate the file. Comment out the include directive in the category file and add a work-in-progress indicator:
  ```asciidoc
  // include::../../partials/hints/{challengeKey}.adoc[]
  🚧 Work in progress...
  ```
- **Unmapped Categories**: If a challenge in `challenges.yml` specifies a category lacking a corresponding `part2/<category>.adoc` file, check `nav.adoc` and `book.adoc`. If the category is entirely novel, pause and report the unmapped category rather than generating arbitrary ad-hoc files.
- **Schema & Key Mismatches**: If `challenges.yml` lacks mandatory fields (e.g., `key`, `name`, `category`, `difficulty`), report the discrepancy rather than writing broken or incomplete AsciiDoc structures.

---

## 7. Pre-Finalization Verification & Quality Assurance

Before concluding any change, agents must execute the following validation steps:

1. **Checklist Validation**: Review and satisfy all checks in `.ai/challenge-maintenance/checklists/challenge_verification.md`.
2. **Build Verification**: Run the Antora build command to ensure syntax integrity, include resolution, and valid cross-references:
   ```powershell
   npx antora antora-playbook.yml
   ```
3. **Reference Integrity**: Ensure all `xref` targets, section anchors, and conditional blocks (`ifeval::[...]` / `endif::[]`) resolve without syntax errors or broken links.
4. **Boundary Audit**: Confirm that zero modifications were made to `docs/modules/ROOT/partials/hints/` and that `scoreBoardChallenge` contains no hint inclusions.
