# 💤 Neovim Configuration

A personal Neovim setup built on [lazy.nvim](https://github.com/folke/lazy.nvim), leaning heavily on
[snacks.nvim](https://github.com/folke/snacks.nvim) for pickers/explorer/UI, Treesitter for editing,
and `nvim-lspconfig` + `mason.nvim` for language tooling (Ruby, TypeScript/JS, Lua first-class).

## Table of Contents

- [⚙️ Settings](#️-settings)
- [📦 Plugins](#-plugins)
- [⌨️ Keymaps](#️-keymaps)

---

## ⚙️ Settings

Core options live in [`init.lua`](init.lua):

| Setting | Value |
|---|---|
| Leader / Local leader | `<Space>` / `,` |
| Colorscheme | `tokyonight-moon` |
| `termguicolors` | enabled |
| Line numbers | enabled |
| Indentation | 2 spaces, tabs expanded (`expandtab`), `smartindent` |
| Folding | Treesitter expression folds (`foldexpr`), start fully unfolded (`foldlevel(start) = 99`) |
| `conceallevel` | `2` |
| `netrw` | disabled — replaced by the Snacks explorer |

**Custom filetype detection:**

| Pattern | Filetype |
|---|---|
| `openapi.ya?ml` | `yaml.openapi` |
| `*.openapi.json` | `json.openapi` |
| `.env`, `.env.development[.local]`, `.env.test`, `.env.production` | `sh` |
| `*.norg` | `neorg` |

**Startup profiling:** running Neovim with `PROF=1` boots `snacks.profiler` and stops it on `VimEnter`.

---

## 📦 Plugins

### 🎨 UI & Appearance
- **tokyonight.nvim** — active colorscheme (`moon` variant, loaded eagerly with top priority)
- **neovim-ayu** — alternate colorscheme (`mirage` flavor)
- **lualine.nvim** — statusline
- **bufferline.nvim** — tab-style buffer line
- **which-key.nvim** — popup hints for every leader-prefixed group below (helix preset)
- **nvim-highlight-colors** — inline swatches for color codes, Tailwind-aware
- **nvim-navic** — LSP breadcrumbs (installed, available for winbar/statusline integration)
- **scope.nvim** — keeps buffer lists isolated per tab

### 🗂️ Explorer, Pickers & Navigation
- **snacks.nvim** — the backbone of this config: file explorer, fuzzy pickers (files, grep, buffers,
  registers, git, LSP symbols/refs/definitions), notifier, dashboard, indent guides, terminal, animations
- **nvim-spectre** — project-wide (and file-scoped) search & replace
- **harpoon** — pin files for instant re-jumping
- **telescope.nvim** — pulled in as a dependency of Neogit/Neorg/tiny-code-action; drives `:Telescope neorg …` commands

### 🌿 Git
- **neogit** — Magit-style git porcelain
- **lazygit.nvim** — opens the LazyGit TUI in a floating window
- **gitsigns.nvim** — hunk signs, staging, preview, blame, hunk navigation
- **diffview.nvim** — side-by-side diff & file-history viewer

### 🧠 LSP, Completion & Formatting
- **nvim-lspconfig** — LSP client setup; `ruby_lsp` enabled by default
- **mason.nvim** / **mason-lspconfig.nvim** — installs/bridges `lua_ls`, `eslint`, `ts_ls`, `standardrb`
- **nvim-cmp** + **cmp-nvim-lsp** — completion engine and LSP source
- **LuaSnip** + **friendly-snippets** + **cmp_luasnip** — snippets, plus custom Ruby/TypeScript snippets
- **tiny-code-action.nvim** — floating code-action picker
- **conform.nvim** — format-on-save orchestrator (`stylua`, `prettier(d)`, `standardrb`, `isort`/`black`,
  `rustfmt`, …), plus a standalone `standardrb --lsp` client for Ruby files

### ✍️ Editing & Text Objects
- **nvim-treesitter** (`main` branch) — highlighting, indentation, auto-tag
- **nvim-autopairs** — auto-close brackets/quotes
- **vim-surround** — surround text objects
- **tabular** — align text on a delimiter
- **nvim-peekup** — preview register contents before pasting
- **undotree** — visual undo-history browser

### 🧩 Notes & Docs
- **neorg** — structured note-taking (journal workspace at `~/journal`)
- **markdown-preview.nvim** — live browser preview for Markdown
- **diagram.nvim** + **image.nvim** — render Mermaid diagrams inline in Markdown/Neorg buffers

### 🔌 Misc / Infra
- **remote-sshfs.nvim** — browse & edit remote filesystems over SSH via the Snacks picker
- **lazydocker.nvim** — floating LazyDocker TUI
- **bufresize.nvim** — keeps window proportions sane on resize
- **yuck.vim** — syntax for Eww's `yuck` config files
- **lazy.nvim** — the plugin manager driving all of the above

> **Present but not currently loaded:** `ai.lua` (`claude-code.nvim`, `avante.nvim`), `fun.lua`
> (`tidal.nvim`, `strudel.nvim` for livecoding), and `orgmode.lua` (`orgmode`, `org-roam`) define specs
> that aren't included in `lazy_setup.lua`'s `spec` table yet — kept around for quick re-enabling.

---

## ⌨️ Keymaps

Leader is `<Space>`. Groups below match the `which-key` groupings declared in [`lua/lazy_plugins/ui.lua`](lua/lazy_plugins/ui.lua).

### 🪟 Windows, Splits & Tabs
| Key | Action |
|---|---|
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Move focus between splits |
| `<leader>%` | Split vertically |
| `<leader>-` | Split horizontally |
| `<leader>tk` | Turn a vertical split into a horizontal one |
| `<leader>th` | Turn a horizontal split into a vertical one |
| `<M-S-h>` `<M-S-l>` | Grow window left / right |
| `<M-S-k>` `<M-S-j>` | Grow / shrink window height |
| `<S-l>` / `<S-h>` | Next / previous buffer |
| `<M-l>` / `<M-h>` | Next / previous tab |

### 📑 Buffers — `<leader>b`
| Key | Action |
|---|---|
| `<leader>bd` | Close current buffer |
| `<leader>bp` | Pin buffer |
| `<leader>bc` | Close every buffer except this one |
| `<leader>br` | Close buffers to the right |

### 🗂️ Explorer & Pickers — `<leader>t` (Snacks)
| Key | Action |
|---|---|
| `<C-n>` | Toggle the file explorer |
| `<leader>tf` | Find file |
| `<leader>tF` | Smart find (frecency/history-aware) |
| `<leader>tc` | Find a file inside the Neovim config |
| `<leader>tb` | List open buffers |
| `<leader>tB` | Grep across open buffers |
| `<leader>tg` | Live grep |
| `<leader>tR` | Browse Vim registers |

### 🌿 Git — `<leader>g`
| Key | Action |
|---|---|
| `<leader>gn` | Open Neogit |
| `<leader>gl` | Open LazyGit *(also bound by Snacks to "Git Log" — LazyGit wins since it loads later)* |
| `<leader>gL` | Git log for the current line |
| `<leader>gs` | Stage hunk *(also bound by Snacks to "Git Status" — Stage hunk wins)* |
| `<leader>gd` | Diff current buffer against index |
| `<leader>gb` | Toggle current-line git blame |
| `<leader>gp` | Preview hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gF` | Browse git diff hunks (picker) |
| `]c` / `[c` | Next / previous git hunk |
| `dc` | Close Diffview |

### 🧠 Code & LSP — `<leader>c`
Buffer-local, active only once an LSP client attaches:

| Key | Action |
|---|---|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `go` | Go to type definition |
| `gr` | List references |
| `gs` | Signature help |
| `<F2>` | Rename symbol |
| `<F3>` (normal & visual) | Format buffer/selection |
| `<F4>` | Code action |

Leader group:

| Key | Action |
|---|---|
| `<leader>ca` | Floating code-action picker |
| `<leader>cl` | Restart the LSP client |
| `<leader>cd` | Buffer diagnostics list |
| `<leader>cD` | Diagnostics list |
| `<leader>cr` | List references (picker) |
| `<leader>ci` | Go to implementation (picker) |
| `<leader>cf` | Show document symbols |
| `<leader>i` | Open diagnostic float under cursor |
| `<leader>f` | Format file (`conform.nvim`, normal & visual) |

### 🔎 Search & Replace — `<leader>s` (Spectre)
| Key | Action |
|---|---|
| `<leader>S` | Toggle Spectre |
| `<leader>sw` | Search word under cursor (visual: selection), project-wide |
| `<leader>sf` | Same, scoped to the current file |

### 🔱 Harpoon — `<leader>h`
| Key | Action |
|---|---|
| `<leader>ha` | Add current file to Harpoon |
| `<leader>hh` | Toggle the Harpoon quick menu |

### 📝 Neorg — `<leader>n`
| Key | Action |
|---|---|
| `<leader>nw` | Switch workspace |
| `<leader>nh` | Search headings |
| `<leader>nf` | Find `.norg` files |
| `<leader>ni` | Open index |
| `<leader>nr` | Return to previous location |
| `<leader>ns` | Cycle a todo item's state |

### 🔔 Notifications — `<leader>k`
| Key | Action |
|---|---|
| `<leader>kh` | Show notification history |
| `<leader>kc` | Hide/clear notifications |

### 🐳 Docker — `<leader>l`
| Key | Action |
|---|---|
| `<leader>ld` | Open LazyDocker |

### 📋 Clipboard & Registers
| Key | Action |
|---|---|
| `<leader>w` (visual) | Yank selection to the system clipboard |
| `<leader>W` (normal/visual) | Yank line/selection to the system clipboard |
| `p` / `P` | Paste the last **yank** (not deletes) after / before cursor |
| `p` (visual) | Paste over selection without clobbering the unnamed register |
| `gp` | Paste the unnamed register (last yank *or* delete) |

### 🔍 Search & Diagnostics Navigation
| Key | Action |
|---|---|
| `n` / `N` | Next / previous search match, screen re-centered |
| `]d` / `[d` | Next / previous diagnostic, with a floating preview |
| `<leader>h` | Clear search highlight |
| `<leader>fa` | Toggle fold recursively under cursor |

### ✂️ Snippets (insert & select mode)
| Key | Action |
|---|---|
| `<C-k>` | Expand snippet or jump to next placeholder |
| `<C-j>` | Jump to previous placeholder |
| `<C-l>` | Cycle to the next choice in a choice node |

### 💬 Comments
| Key | Action |
|---|---|
| `<leader>/` (normal) | Toggle line comment |
| `<leader>/` (visual) | Toggle comment on selection |

### 🖥️ Terminal
| Key | Action |
|---|---|
| `<M-1>` | Toggle a vertical terminal |
| `<M-2>` | Toggle a horizontal terminal |

### 🗺️ Diagrams (Markdown & Neorg buffers only)
| Key | Action |
|---|---|
| `M` | Preview a Mermaid diagram under cursor |

### 🛠️ Misc
| Key | Action |
|---|---|
| `<leader>e` | Copy the current buffer's relative path to the clipboard |
| `<leader>z` | Show the weather for Aracaju & São Paulo |
