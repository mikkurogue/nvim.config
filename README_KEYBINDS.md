# Keybind Documentation

This directory contains comprehensive keybind documentation and utilities for your Neovim configuration.

## 📚 Documentation Files

### [`KEYBINDS.md`](./KEYBINDS.md)
**Complete keybind reference** for all modes
- Organized by mode (Normal, Visual, Insert, Terminal)
- Includes descriptions and source files
- Comprehensive tables for easy lookup

### [`INSERT_MODE_KEYS.txt`](./INSERT_MODE_KEYS.txt)
**Quick reference card** for insert mode keybinds
- Formatted for easy reading
- Highlights the special `<C-j>` multi-purpose key
- Perfect for printing or quick lookup

### [`CHANGES.md`](./CHANGES.md)
**Summary of changes** made to add dashboard keybinds
- Documents modifications to `snacks.lua`
- Explains where keybinds should go (snacks.lua vs which-key.lua)
- Answers to your original questions

## 🔧 Utility Scripts

### [`find_insert_keybinds.lua`](./find_insert_keybinds.lua)
**Automated keybind finder**
```bash
nvim -l find_insert_keybinds.lua
```
- Scans all Lua files in your config
- Extracts insert mode keybinds
- Useful for discovering new or forgotten keybinds

## 🎯 Quick Answers

### Where should dashboard keybinds be added?
**Answer**: `lua/plugins/snacks.lua` ✅

The dashboard configuration lives in the Snacks plugin setup, so that's where the dashboard-specific keybinds should be defined.

### How to find insert mode keybinds (like C-j for AI)?
**Answer**: Multiple ways:
1. Read [`INSERT_MODE_KEYS.txt`](./INSERT_MODE_KEYS.txt) for a quick reference
2. Read [`KEYBINDS.md`](./KEYBINDS.md) for complete documentation
3. Run `nvim -l find_insert_keybinds.lua` to scan programmatically
4. Check these files manually:
   - `lua/plugins/cmp/blink.lua`
   - `lua/plugins/ai/copilot.lua`
   - `lua/plugins/ai/sidekick.lua`
   - `lua/core/keymaps.lua`

## ⭐ Key Insert Mode Keybinds

| Key | Description |
|-----|-------------|
| `<C-j>` | 🚀 **Universal accept** (Blink/Copilot/Sidekick/Snippet) |
| `<C-s>` | Save and return to normal |
| `<Tab>` | Next completion |
| `<S-Tab>` | Previous completion |
| `<M-]>` | Next Copilot suggestion |
| `<M-[>` | Previous Copilot suggestion |

## 🗑️ Cleanup

After reviewing the documentation, you can safely delete:
- `find_insert_keybinds.lua` (if you don't need the utility)
- `CHANGES.md` (temporary change log)
- `README_KEYBINDS.md` (this file)

Keep these for reference:
- `KEYBINDS.md` (main documentation)
- `INSERT_MODE_KEYS.txt` (quick reference)

## 📝 Modifications Made

### Updated: `lua/plugins/snacks.lua`
Added dashboard keybinds that appear when you press `<leader>h`:
- `f` - Find File
- `e` - File Explorer
- `c` - Config Files
- `w` - Live Grep
- `b` - Buffers
- `s` - Restore Session
- `S` - Select Session
- `g` - LazyGit
- `h` - Dashboard
- `q` - Quit

---

**Need help?** Check [`KEYBINDS.md`](./KEYBINDS.md) for the complete reference!
