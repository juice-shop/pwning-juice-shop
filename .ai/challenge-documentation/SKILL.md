---
name: challenge-documentation
description: Structural blueprint and AsciiDoc layout reference for challenges in Pwning OWASP Juice Shop.
---

# Challenge Documentation and Structure Skill

This skill defines the canonical documentation architecture, layout conventions, and AsciiDoc formatting rules for challenges across the OWASP Juice Shop companion guide (`pwning-juice-shop`).

## 1. Guidance Layering & Precedence

When multiple guidance layers apply during documentation tasks, resolve conflicts using the following precedence:
1. **Explicit Task Instructions**: Direct constraints and scopes provided in the active prompt.
2. **Checklists & Templates**: `.ai/challenge-maintenance/checklists/challenge_verification.md` and `.ai/challenge-maintenance/templates/new_challenge_section.adoc` (govern quality gating and section structure).
3. **Operational Maintenance Guidance**: `.ai/challenge-maintenance/SKILL.md` (governs mutation workflows and synchronization rules).
4. **Structural Reference**: This document (`.ai/challenge-documentation/SKILL.md` — governs layout architecture and AsciiDoc conventions).
5. **General Operating Guidelines**: `AGENTS.md` (repository-wide governance and operational rules).

## 2. Source of Truth & Repository Targets

- **Source of Truth**: `docs/modules/ROOT/assets/data/challenges.yml` is the canonical authority for challenge definitions (names, keys, categories, descriptions, difficulties, hints, and tags). Documentation text expands upon this source with educational context but must never contradict it.
- **Repository Targets**:
  - Centralized Index Tables: `docs/modules/ROOT/pages/part2/README.adoc`
  - Category Chapter Files: `docs/modules/ROOT/pages/part2/<category>.adoc` (e.g., `injection.adoc`, `xss.adoc`, `broken-access-control.adoc`)
  - Solutions Appendix: `docs/modules/ROOT/pages/appendix/solutions.adoc`
  - Challenge Tag Catalog: `docs/modules/ROOT/pages/part1/challenges.adoc`
  - Hint Partials (Read-Only Reference): `docs/modules/ROOT/partials/hints/*.adoc`

## 3. Explicit Change Boundaries

- **Permitted Modifications**:
  - Updating challenge rows in `docs/modules/ROOT/pages/part2/README.adoc`.
  - Adding or updating challenge sections and summary tables in `docs/modules/ROOT/pages/part2/<category>.adoc`.
  - Adding or updating solution steps or placeholders in `docs/modules/ROOT/pages/appendix/solutions.adoc`.
  - Adding new challenge tags to `docs/modules/ROOT/pages/part1/challenges.adoc`.
- **Strictly Prohibited Modifications**:
  - **Hint Partials**: AI agents MUST NEVER create, edit, or delete files in `docs/modules/ROOT/partials/hints/`. These are managed exclusively by the `partialize_hints.yml` pipeline (`./partializeHints.sh`).
  - **Score Board Challenge**: The Score Board challenge (`scoreBoardChallenge`) has no hints and must NEVER have a hint partial file or hint `include::` directive.
  - **Antora & Site Infrastructure**: Do NOT modify `antora-playbook.yml`, `docs/antora.yml`, `package.json`, or `.github/workflows/*` during documentation tasks.
  - **Unrelated Content**: Do NOT touch non-challenge chapters (`introduction/`, `part1/` non-tag files, `part3/`, `part4/`, `part5/`) unless explicitly instructed.

## 4. Documentation Architecture & Layout Conventions

### Centralized Challenge Tables (`part2/README.adoc`)
All challenges are listed in `docs/modules/ROOT/pages/part2/README.adoc`. The tables are conditionally rendered based on the `{is_ctf}` attribute:

- **CTF Mode (`ifeval::[{is_ctf} == 1]`)**:
  - Columns: `Name`, `Description`, `Hints`.
  - `Hints` column contains an `xref` link with bulb emoji (`💡`) to the specific challenge section in its category page (e.g., `xref:part2/xss.adoc#_anchor_name[💡]`).
- **Normal Mode (`ifeval::[{is_ctf} == 0]` or default block)**:
  - Columns: `Name`, `Description`, `Hints`, `Solution`.
  - `Hints` column: identical to CTF mode.
  - `Solution` column contains an `xref` link with book emoji (`📕`) to the step-by-step solution in `appendix/solutions.adoc` (e.g., `xref:appendix/solutions.adoc#_anchor_name[📕]`).
- **Ordering**: Both tables must be sorted alphabetically by challenge name.

### Category Pages (`part2/<category>.adoc`)
Challenges are grouped into category files in `docs/modules/ROOT/pages/part2/`. Each page follows this structure:

1. **Category Overview**: Educational description of the vulnerability type.
2. **Challenges Overview Table**: Summary table listing `Name`, `Description`, and `Difficulty` (represented by star emojis: ⭐ to ⭐⭐⭐⭐⭐⭐). Sorted alphabetically by challenge name.
3. **Reconnaissance Advice**: (Optional) Practical reconnaissance tips.
4. **Challenge Sections**: Dedicated `==` level heading for each challenge:
   - Anchor: `[[_{anchor_name}]]` immediately preceding the header. Anchor name is lowercase, special characters removed, spaces replaced by underscores.
   - Heading Text: Usually the challenge description or a concise instructional title.
   - Body Prose: Original, high-quality prose explaining challenge context. Do NOT copy descriptions verbatim from `challenges.yml` or concatenate hints.
   - Hints Include: `include::../../partials/hints/{challengeKey}.adoc[]`.
     - Add active include ONLY if the partial exists in `docs/modules/ROOT/partials/hints/`.
     - If the partial does not yet exist, comment out the directive (`// include::../../partials/hints/{challengeKey}.adoc[]`) and add a `🚧 Work in progress...` notice.
     - Exception: `scoreBoardChallenge` has no hints and no include.

### Step-by-Step Solutions (`appendix/solutions.adoc`)
All solutions are centralized in `docs/modules/ROOT/pages/appendix/solutions.adoc`:

- Grouped by difficulty levels (`== ⭐ Challenges` through `== ⭐⭐⭐⭐⭐⭐ Challenges`).
- Each solution has a `=== {Section Header}` subsection matching the challenge section title in the category page.
- Subsections are sorted alphabetically within each difficulty level.
- Format: Numbered step list, optional screenshots (`image::appendix/...`), and references assuming `http://localhost:3000` as the default host.

## 5. Handling Ambiguity & Unmapped Source Data

- **Missing Solution Steps**: When adding a challenge without verified solution steps, insert the standard placeholder `// TODO Add solution for {challengeKey}` under the `=== {Section Header}`. Never fabricate walkthrough steps, payloads, or credentials.
- **Unmapped Categories**: If a challenge in `challenges.yml` references a category without an existing `part2/<category>.adoc` file, do not create ad-hoc files without verifying against `docs/modules/ROOT/nav.adoc` and existing structure.
- **Missing Hint Partials**: Do not create placeholder files in `partials/hints/`. Keep the include directive commented out until the upstream pipeline generates the file.

## 6. Verification & Quality Assurance

Before completing documentation updates, verify:
1. **Alphabetical Ordering**: Verify `part2/README.adoc` tables, category summary tables, tag lists, and solution subsections.
2. **Anchor & Link Integrity**: Ensure all `xref` targets in `part2/README.adoc` resolve to valid anchors in category pages and `solutions.adoc`.
3. **Include Validity**: Ensure no uncommented `include::` directives point to missing partial files.
