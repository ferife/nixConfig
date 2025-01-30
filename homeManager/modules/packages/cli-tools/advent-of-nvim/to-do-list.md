# To Do List for Neovim

- [x] Install && configure tpope/commentary.nvim

- [ ] Auto close parentheses, brackets, braces
- [ ] Auto format brackets, parantheses, braces when hitting newline from within them
- [ ] Markdown Display

- [ ] Obsidian.md Integration
  - [ ] Good markdown workflow
  - [ ] Working with LaTeX inside markdown files
  - [ ] Spell check
  - [ ] Fold headings
  - [ ] Workflow with checklist items (hopefully with custom statuses)
  - [ ] Obsidian file properties for Dataview-like workflow

- [ ] Snippet Management

- [ ] Consider whether there should be certain keyboard mappings/actions that only work on specific file types

- [ ] Code Runner

- [ ] Switch Java language server to JDTLS (named `jdt-language-server` in nixpkgs)
  - Also install the extension `nvim-jdtls` to work with it

## Vim Tutor Lessons To Review

- Lesson 3 (all of it)
- Lesson 4.2 The Search Command (`/string`)
- Lesson 4.4 The Substitute Command
- Lesson 5.3 Selecting Text to Write (visual mode)
- Lesson 5.4 Retrieving & Merging Files (printing the output of a terminal command into the text file)
  - Typing `:r !<command>` (where `<command>` is any terminal command) will put the output of `<command>` into the text file, below the cursor
- Lesson 6.1 The Open Command (o/O)
- Lesson 6.4 Copy and Paste Text
