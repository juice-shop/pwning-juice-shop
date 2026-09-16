# Challenge Documentation Verification Checklist

This checklist is the mandatory validation gate for challenge maintenance operations. Run these checks to verify synchronization between the authoritative source of truth (`docs/modules/ROOT/assets/data/challenges.yml`) and all documentation targets before finalizing changes.

## 1. Inventory & Data Integrity
- [ ] Load all challenge entries from canonical `docs/modules/ROOT/assets/data/challenges.yml`.
- [ ] Verify all required challenge fields exist (`key`, `name`, `category`, `description`, `difficulty`).
- [ ] Flag any schema deviations or unmapped categories before proceeding with documentation edits.

## 2. Master List Verification (`docs/modules/ROOT/pages/part2/README.adoc`)
- [ ] **CTF Mode Table (`ifeval::[{is_ctf} == 1]`)**:
  - [ ] Every challenge from inventory is present with correct `Name`, `Description`, and `xref:part2/<category>.adoc#_{anchor_name}[💡]`.
  - [ ] Table is sorted in strict alphabetical order by challenge `Name`.
- [ ] **Normal Mode Table (`ifeval::[{is_ctf} == 0]`)**:
  - [ ] Every challenge from inventory is present with correct `Name`, `Description`, `xref:part2/<category>.adoc#_{anchor_name}[💡]`, and `xref:appendix/solutions.adoc#_{anchor_name}[📕]`.
  - [ ] Table is sorted in strict alphabetical order by challenge `Name`.
- [ ] **Ghost Challenge Removal**: Remove any entries in both tables that do not exist in `challenges.yml`.

## 3. Category Files Verification (`docs/modules/ROOT/pages/part2/*.adoc`)
- [ ] **Summary Table**:
  - [ ] Every category challenge is present with matching `Name`, `Description`, and star difficulty rating (⭐ to ⭐⭐⭐⭐⭐⭐).
  - [ ] Summary table is sorted in strict alphabetical order by challenge `Name`.
- [ ] **Challenge Section**:
  - [ ] Every challenge has a dedicated section header (`== {Section Header}`) preceded by anchor `[[_{anchor_name}]]`.
  - [ ] Anchor matches the exact anchor referenced in `part2/README.adoc`.
  - [ ] Description prose provides educational context and is NOT a verbatim copy of `challenges.yml` or a concatenation of hints.
  - [ ] Hint include directive is present: `include::../../partials/hints/{challengeKey}.adoc[]` (active only if partial exists; commented out with `🚧 Work in progress...` if missing).
  - [ ] `scoreBoardChallenge` has NO hint include or hint partial.
- [ ] **Ghost Section Removal**: Remove sections for challenges that no longer exist in `challenges.yml`.

## 4. Hint Partials Boundary Audit (`docs/modules/ROOT/partials/hints/*.adoc`)
- [ ] Verify that AI agents have made NO direct modifications (create, edit, delete) to files in `docs/modules/ROOT/partials/hints/`.
- [ ] Confirm `scoreBoardChallenge` has NO hint partial.
- [ ] Any missing or orphaned hint partials are left for the automated `partialize_hints.yml` pipeline (`./partializeHints.sh`).

## 5. Solutions Guide Verification (`docs/modules/ROOT/pages/appendix/solutions.adoc`)
- [ ] Every challenge from inventory has a corresponding `=== {Section Header}` subsection under its correct difficulty heading (`== ⭐... Challenges`).
- [ ] Subsections within each difficulty level are sorted in strict alphabetical order.
- [ ] Every subsection contains either verified step-by-step instructions or the standardized placeholder:
  `// TODO Add solution for {challengeKey}`
- [ ] Remove solution subsections for challenges no longer in `challenges.yml`.

## 6. Tags Catalog Verification (`docs/modules/ROOT/pages/part1/challenges.adoc`)
- [ ] List all unique tags present across `challenges.yml`.
- [ ] Verify every tag is documented in `docs/modules/ROOT/pages/part1/challenges.adoc`.
- [ ] Verify the documented tags list is sorted in strict alphabetical order.

## 7. Cross-Reference & Link Audit
- [ ] Verify that all `xref` links in `part2/README.adoc` resolve to valid anchors in category pages and `solutions.adoc`.
- [ ] Verify that all intra-document anchors (`<<_anchor_name,Label>>`) resolve correctly.
- [ ] Ensure conditional blocks (`ifeval::[...]` and `endif::[]`) remain properly formatted and balanced.
