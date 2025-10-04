# Neovim Keybinds Reference

This document lists all custom keybindings configured in this Neovim setup.

## Leader Key
- **Leader**: `<Space>`

---

## Dashboard Keybinds (Snacks Dashboard)
When you open the dashboard with `<leader>h`, these keys are available:

| Key | Description |
|-----|-------------|
| `n` | New File |
| `f` | Find Files (fff.nvim) |
| `b` | Open Buffers (Telescope) |
| `c` | Config Files (fff.nvim) |
| `q` | Quit |

---

## Normal Mode Keybinds

### File Operations
| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>vs` | Vertical split | keymaps.lua |
| `<leader>w` | Save current buffer | keymaps.lua |
| `<leader>e` | File Explorer (Snacks) | snacks.lua |
| `ff` | Open file picker (fff) | fff.lua |
| `<leader>fc` | Find Config File | snacks.lua |
| `cR` | Rename current file | snacks.lua |

### Buffer Management
| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>fb` | Buffers | snacks.lua |
| `<leader>m` | Open Snipe buffer menu | snipe.lua |
| `bc` | Close current buffer | snacks.lua |
| `bcc` | Close all buffers | snacks.lua |
| `bcC` | Close all buffers except current | snacks.lua |

### Search & Navigation
| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>fw` | Live Grep | snacks.lua |
| `<Esc>` | Clear search highlight | keymaps.lua |

### LSP & Code Actions
| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>la` | Code actions | keymaps.lua |
| `<leader>ld` | Show Line Diagnostics | keymaps.lua |
| `<leader>lD` | Show All Diagnostics (Telescope) | keymaps.lua |
| `gd` | Goto Definition | snacks.lua |
| `gD` | Goto Declaration | snacks.lua |
| `gr` | References | snacks.lua |
| `gI` | Goto Implementation | snacks.lua |
| `gy` | Goto Type Definition | snacks.lua |

### Diagnostics & Trouble
| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>xx` | Diagnostics (Trouble) | trouble.lua |
| `<leader>xX` | Buffer Diagnostics (Trouble) | trouble.lua |
| `<leader>cs` | Symbols (Trouble) | trouble.lua |
| `<leader>cl` | LSP Definitions/references (Trouble) | trouble.lua |
| `<leader>xL` | Location List (Trouble) | trouble.lua |
| `<leader>xQ` | Quickfix List (Trouble) | trouble.lua |

### Git Operations
| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>gg` | Open Git interface (LazyGit) | keymaps.lua |
| `gb` | Open git blame for current line | snacks.lua |

### Comments
| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>/` | Toggle comment line | keymaps.lua |

### Session Management
| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>Ss` | Load session for current directory | keymaps.lua |
| `<leader>Sf` | Select a session to load | keymaps.lua |

### UI & Appearance
| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>h` | Open dashboard | snacks.lua |
| `<leader>th` | Theme Switcher | keymaps.lua |
| `uC` | Colorschemes | snacks.lua |

### Terminal
| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>tf` | Toggle floating terminal | keymaps.lua |

### AI & Sidekick
| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>aa` | Sidekick Toggle CLI | sidekick.lua |
| `<leader>as` | Sidekick Select CLI | sidekick.lua |
| `<leader>ap` | Sidekick Select Prompt | sidekick.lua |
| `<C-.>` | Sidekick Switch Focus | sidekick.lua |
| `<leader>ac` | Sidekick Claude Toggle | sidekick.lua |

### Exit
| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>q` | Quit | keymaps.lua |
| `<leader>Q` | Quit all | keymaps.lua |

---

## Visual Mode Keybinds

| Keybind | Description | Source |
|---------|-------------|--------|
| `<leader>/` | Toggle comment block | keymaps.lua |
| `<leader>aa` | Sidekick Toggle CLI | sidekick.lua |
| `<leader>as` | Sidekick Send Visual Selection | sidekick.lua |
| `<leader>ap` | Sidekick Select Prompt | sidekick.lua |
| `<leader>ac` | Sidekick Claude Toggle | sidekick.lua |

---

## Insert Mode Keybinds

### General
| Keybind | Description | Source |
|---------|-------------|--------|
| `<C-s>` | Save from insert mode and back to normal | keymaps.lua |

### Completion (Blink.cmp)
| Keybind | Description | Source |
|---------|-------------|--------|
| `<CR>` | Accept completion | blink.lua |
| `<Tab>` | Select next completion | blink.lua |
| `<S-Tab>` | Select previous completion | blink.lua |
| `<C-j>` | Accept completion/sidekick NES/copilot/snippet forward (multi-purpose) | blink.lua |

### AI Copilot
| Keybind | Description | Source |
|---------|-------------|--------|
| `<M-]>` | Next copilot suggestion | copilot.lua |
| `<M-[>` | Previous copilot suggestion | copilot.lua |
| `<C-]>` | Dismiss copilot suggestion | copilot.lua |
| `<C-Space>` | Accept copilot suggestion (if gh-copilot.vim enabled) | gh-copilot.lua |

### Focus
| Keybind | Description | Source |
|---------|-------------|--------|
| `<C-.>` | Sidekick Switch Focus | sidekick.lua |

---

## Terminal Mode Keybinds

| Keybind | Description | Source |
|---------|-------------|--------|
| `<C-.>` | Sidekick Switch Focus | sidekick.lua |

---

## Special Multi-Purpose Keybinds

### `<C-j>` in Insert Mode (Priority Chain)
This keybind tries multiple actions in order:
1. Accept selected completion from Blink menu
2. Jump or apply Sidekick NES suggestion
3. Accept Copilot suggestion if visible
4. Move forward in snippet
5. Fallback to default behavior

This makes `<C-j>` a universal "accept/continue" key for AI and completion features.

---

## Notes

- **Snacks.lua**: Contains both dashboard keybinds and regular mode keybinds for navigation
- **Which-key**: The which-key plugin will show available keybinds when you press `<leader>` and wait
- **Insert Mode AI**: `<C-j>` is the primary key for accepting AI suggestions (Copilot, Sidekick)
- **Disabled**: `github/copilot.vim` is disabled in favor of `copilot.lua`

---

## How to Find More Keybinds

To see all keybinds in real-time:
1. Press `<leader>` and wait - which-key will show available bindings
2. Check `:map` in Neovim to see all mappings
3. Check `:map <leader>` to see leader mappings
4. Check `:imap` for insert mode mappings
5. Check `:vmap` for visual mode mappings

## Configuration Files

- **Main keymaps**: `lua/core/keymaps.lua`
- **Dashboard**: `lua/plugins/snacks.lua`
- **AI/Completion**: `lua/plugins/cmp/blink.lua`, `lua/plugins/ai/copilot.lua`, `lua/plugins/ai/sidekick.lua`
- **Other plugins**: Various files in `lua/plugins/`
