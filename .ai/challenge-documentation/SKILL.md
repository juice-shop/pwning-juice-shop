### Challenge Documentation and Structure Skill

This skill summarizes the documentation and structure of challenges in the OWASP Juice Shop companion guide (`pwning-juice-shop`).

#### 1. Centralized Challenge Tables (`README.adoc`)
All challenges are listed in `docs/modules/ROOT/pages/part2/README.adoc`. The tables are split based on the `{is_ctf}` attribute:

- **CTF Mode (`is_ctf == 1`)**:
  - Columns: `Name`, `Description`, `Hints`.
  - `Hints` column contains a link (bulb emoji 💡) to the specific challenge section in its category page.
- **Normal Mode (`is_ctf == 0`)**:
  - Columns: `Name`, `Description`, `Hints`, `Solution`.
  - `Hints` column: same as CTF mode.
  - `Solution` column contains a link (book emoji 📕) to the specific step-by-step solution in the `appendix/solutions.adoc` page.

#### 2. Category Pages (`docs/modules/ROOT/pages/part2/*.adoc`)
Challenges are grouped by category (e.g., `xss.adoc`, `injection.adoc`). Each page follows this structure:

- **Category Introduction**: General description of the vulnerability type.
- **Challenges Overview Table**: A table at the beginning of the chapter listing:
  - `Name`, `Description`, `Difficulty` (represented by star emojis ⭐).
- **Challenge Sections**: Each challenge has its own `==` level heading.
  - Heading text is usually the challenge description or a closely related title.
  - The heading includes an anchor (e.g., `[[_anchor_name]]`) for direct linking from the main table.
  - Content includes a brief explanation of the challenge context.
  - **Hints Handling**: Hints are included from external files located in `docs/modules/ROOT/partials/hints/` using the `include::` directive.
y    - **CRITICAL**: Hint partials are created and updated exclusively by the `partialize_hints.yml` pipeline. AI agents MUST NEVER create or modify these files.
    - The 'Score Board' challenge (`scoreBoardChallenge`) does not have hints and must NEVER have a hint partial file.
  - **New Challenge Preparation Rules**:
    - The hint include (`include::partial$hints/*.adoc[]`) should only be added if a matching partial already exists in `docs/modules/ROOT/partials/hints/`.
    - If the partial does not exist, the expected partial include should be commented out (e.g., `// include::partial$hints/newChallenge.adoc[]`) and a `🚧 Work in progress...` note should be added below it.

#### 3. Hints Handling
- Hints are stored as small AsciiDoc snippets in `docs/modules/ROOT/partials/hints/`.
- **Note**: These snippets are managed exclusively by the `partialize_hints.yml` pipeline. AI agents MUST NOT modify them.
- This modular approach allows hints to be updated independently and potentially reused.
- Challenges in category pages typically end with an `include` of their corresponding hint file.
- **Exception**: The 'Score Board' challenge has no hints and no hint partial.

#### 4. Step-by-Step Solutions (`appendix/solutions.adoc`)
- All solutions are centralized in `docs/modules/ROOT/pages/appendix/solutions.adoc`.
- Solutions are grouped by difficulty levels (e.g., `== ⭐ Challenges`, `== ⭐⭐ Challenges`, etc.).
- Each solution has a `===` level heading matching the challenge name.
- **Format**:
  - Usually a numbered list of steps.
  - Often includes images (from `appendix/` directory) to illustrate the process.
  - URLs in solutions are typically based on `http://localhost:3000`.
  - Links to other parts of the book (e.g., `xref:part1/challenges.adoc#_success_notifications`) are used when relevant.
- **New Challenge Preparation Rules**:
  - When preparing a new challenge, the step-by-step solution should get its heading followed by `🚧 Work in progress...` unless the specific steps are already provided in the prompt triggering this skill.
