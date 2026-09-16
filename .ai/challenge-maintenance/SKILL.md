---
name: challenge-maintenance
description: Operational rules, source-of-truth synchronization, change boundaries, and verification procedures for OWASP Juice Shop challenges.
---

# Challenge Maintenance Skill

Use this skill when adding new challenges, updating existing challenges, or synchronizing documentation with the source of truth: `docs/modules/ROOT/assets/data/challenges.yml`.

## 1. Guidance Layering & Precedence

When executing challenge maintenance tasks across the repository, resolve guidance conflicts using the following hierarchy:
1. **Explicit Task Instructions**: Direct constraints, scopes, and parameters defined in the user prompt.
2. **Quality Gates & Checklists**: `.ai/challenge-maintenance/checklists/challenge_verification.md` and `.ai/challenge-maintenance/templates/new_challenge_section.adoc` (mandatory validation rules and section templates).
3. **Operational Maintenance Skill**: This document (`.ai/challenge-maintenance/SKILL.md` — governs data synchronization workflows, change boundaries, and mutation protocols).
4. **Structural Documentation Skill**: `.ai/challenge-documentation/SKILL.md` (governs overall AsciiDoc formatting, syntax conventions, and document architecture).
5. **General Operating Guidelines**: `AGENTS.md` (repository-wide governance, foundational facts, and boundaries).

## 2. Source of Truth & Canonical Data Rules

- **Authoritative Source**: `docs/modules/ROOT/assets/data/challenges.yml` is the single source of truth for all challenge metadata, including challenge keys, names, categories, descriptions, difficulties, hints, and tags.
- **Upstream Sync**: Challenge properties defined in `challenges.yml` reflect upstream OWASP Juice Shop releases and override any conflicting legacy documentation prose.
- **Prose Extension**: Documentation descriptions must provide educational context while remaining factually consistent with `challenges.yml`. Never copy the description from `challenges.yml` 1:1, and do not concatenate hints into descriptions.

## 3. Repository Targets & Change Boundaries

### Concrete Repository Targets
Challenge maintenance tasks target only the following files:
- **Master Challenge Tables**: `docs/modules/ROOT/pages/part2/README.adoc` (Normal mode and CTF mode tables)
- **Category Chapter Files**: `docs/modules/ROOT/pages/part2/<category>.adoc` (e.g., `injection.adoc`, `xss.adoc`, `broken-access-control.adoc`)
- **Solutions Guide**: `docs/modules/ROOT/pages/appendix/solutions.adoc`
- **Tags Catalog**: `docs/modules/ROOT/pages/part1/challenges.adoc` (when new challenge tags are introduced)

### Strict Change Boundaries
- **PERMITTED**:
  - Updating table rows and anchors in `part2/README.adoc`.
  - Adding or modifying category overview rows and detailed challenge sections in `part2/<category>.adoc`.
  - Adding difficulty subsections and solution steps/placeholders in `appendix/solutions.adoc`.
  - Updating the alphabetical tag list in `part1/challenges.adoc`.
- **PROHIBITED**:
  - **Hint Partials**: AI agents MUST NEVER create, edit, or delete files in `docs/modules/ROOT/partials/hints/`. These are generated strictly by `./partializeHints.sh` via `.github/workflows/partialize_hints.yml`.
  - **Score Board Challenge**: The Score Board challenge (`scoreBoardChallenge`) has no hints and must NEVER have a hint partial or `include::` directive.
  - **Data Source Files**: Do NOT modify `challenges.yml` during documentation maintenance tasks unless the task explicitly instructs updating the data source itself.
  - **Build & CI Infrastructure**: Do NOT modify `antora-playbook.yml`, `docs/antora.yml`, `package.json`, or `.github/workflows/*`.
  - **Unrelated Chapters**: Do NOT modify unrelated documentation in `introduction/`, `part1/` (non-tag sections), `part3/`, `part4/`, or `part5/`.

## 4. Scope of Automated Update Tasks

- Keep maintenance operations narrowly scoped and atomic: update only the challenge(s) specified in the task or affected by data changes.
- Avoid wide indiscriminate reformatting or restructuring of untouched challenge sections.
- When syncing multiple challenges, apply changes category-by-category to maintain coherent diffs.

## 5. Handling Ambiguity, Missing Facts & Schema Deviations

- **Missing Solution Steps**: If concrete, verified steps to solve a challenge are not provided, do not fabricate exploit payloads, screenshots, or credentials. Insert the standardized placeholder:
  `// TODO Add solution for {challengeKey}`
- **Missing Hint Partials**: If `docs/modules/ROOT/partials/hints/{challengeKey}.adoc` does not yet exist on disk, do not create it. Comment out the include directive in the category file (`// include::../../partials/hints/{challengeKey}.adoc[]`) and append a `🚧 Work in progress...` notice.
- **Unmapped or New Categories**: If `challenges.yml` contains a category that does not map to an existing `part2/<category>.adoc` file:
  1. Check `docs/modules/ROOT/nav.adoc` and `docs/modules/ROOT/book.adoc` for naming alignment.
  2. If the category is entirely new and unmapped, pause automated file generation and report the unmapped category rather than scattering entries into arbitrary files.
- **Schema & Key Mismatches**: If `challenges.yml` is missing expected fields (e.g., missing `key`, `category`, or `difficulty`), halt synchronization and report the schema discrepancy instead of writing incomplete or corrupt AsciiDoc blocks.

## 6. Operational Workflows

### Adding a New Challenge
1. **Identify Category File**: Determine `docs/modules/ROOT/pages/part2/<category>.adoc` from the `category` attribute in `challenges.yml`.
2. **Update Category Overview Table**: Add the challenge row (`Name | Description | Difficulty`) maintaining alphabetical order by `Name`.
3. **Add Challenge Section in Category Page**: Apply the template from `templates/new_challenge_section.adoc`:
   ```asciidoc
   [[_{anchor_name}]]
   == {Section Header}

   {Description}

   include::../../partials/hints/{challengeKey}.adoc[]
   ```
   *(Comment out `include` if the partial does not exist yet; omit completely for `scoreBoardChallenge`).*
4. **Update `part2/README.adoc`**:
   - Add row to `ifeval::[{is_ctf} == 1]` table with `xref:part2/<category>.adoc#_{anchor_name}[💡]`.
   - Add row to `ifeval::[{is_ctf} == 0]` (normal mode) table with both hint (`💡`) and solution (`📕`) xrefs (`xref:appendix/solutions.adoc#_{anchor_name}[📕]`).
   - Maintain strict alphabetical order by challenge name in both tables.
5. **Update `appendix/solutions.adoc`**:
   - Locate the matching difficulty section (`== ⭐... Challenges`).
   - Add subsection `=== {Section Header}` sorted alphabetically within that difficulty tier.
   - Insert step-by-step instructions if verified, or the placeholder `// TODO Add solution for {challengeKey}`.
6. **Update Tags**: If the challenge introduces a new tag, document it in `docs/modules/ROOT/pages/part1/challenges.adoc` in alphabetical order.

### Updating an Existing Challenge
1. Check `challenges.yml` for altered properties (e.g., renamed challenge, updated description, shifted difficulty).
2. Update all corresponding occurrences across `part2/README.adoc`, `part2/<category>.adoc`, and `appendix/solutions.adoc`.
3. If difficulty changed, move the solution subsection in `appendix/solutions.adoc` to the new difficulty section and resort alphabetically.
4. If the title/anchor changed, update all `xref` targets in `README.adoc` and any internal cross-references.

### Removing Deprecated Challenges
1. Remove entries from both tables in `part2/README.adoc`.
2. Remove summary table row and detailed section from `part2/<category>.adoc`.
3. Remove solution subsection from `appendix/solutions.adoc`.
4. Check if any tag in `part1/challenges.adoc` was exclusively used by the removed challenge and clean up if necessary.
5. Note: Do NOT manually delete hint partial files; let the automated CI pipeline handle partial cleanup.

## 7. Pre-Finalization Verification Checklist

Before concluding any challenge maintenance task, agents MUST execute all verification checks detailed in `.ai/challenge-maintenance/checklists/challenge_verification.md`:
- **Inventory Check**: 100% alignment between `challenges.yml` and documentation targets.
- **Sorting Audit**: Alphabetical ordering in `README.adoc`, category summary tables, tag lists, and difficulty solution tiers.
- **Cross-Reference Audit**: All `xref` links and anchor targets resolve cleanly without broken references.
- **Boundary Audit**: Zero manual edits to `partials/hints/` and zero hint references for `scoreBoardChallenge`.
