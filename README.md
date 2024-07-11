# Install

Mac/Linux:

`git clone https://github.com/mikkurogue/nvim.config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim`

Windows:

For cmd.exe
`git clone https://github.com/mikkurogue/nvim.config.git %userprofile%\AppData\Local\nvim\`

For powershell.exe:
`git clone https://github.com/mikkurogue/nvim.config.git $env:USERPROFILE\AppData\Local\nvim\`

## Dependencies

- [Luarocks](https://github.com/luarocks/luarocks/wiki/Download)
- [Lua 5.3+](https://www.lua.org/download.html)

## Language server deps

- Rust analyzer (rustup)
- TSServer (vstls coming soon hopefully if im not too lazy) (npm i -g typescript-language-server)
- gopls (make sure go is in PATH)

## nvim master mind giga cheet sheet for this config:

### Normal mode:

- `<space> ca` - open code actions
- `i` enter edit mode
- `v` enter visual mode
- `h,j,k,l` traverse the buffer (arrow keys work too)
- `w` move forward to next token start (usually next start of word)
- `b` move backward to previous end token (usually end of previous word)
- `ctrl ww` move from window to window (like neotree to buffer, or buffer to neotree)
- `ctrl wv` create a window vertically with the current buffer
- `:w!` write file (without ! its just write file without forcing it)
- `:q!` quit buffer/window (without ! its just quit without forcing it)
- `:Neotree toggle` nvim script command to toggle the tree
- `:Fzf buffers` fuzzy find through all open buffers/files
- `:Fzf files` fuzzy find through all files in directory
- `shift a [A]` in neotree, this adds file or directory in current position of neotree cursor
- `dd` delete line in buffer
- `d` delete dir/file in neotree at position of cursor
- `p` paste from nvim clipboard (see `y` in visual mode)
- `:! <shell command>` runs a shell command from the nvim command line
- `ctrl arrow-up` / `ctrl arrow-down` create a new cursor up or down a line on the same column.
- `:<any number>` jump to the line number in the current buffer

### Visual mode

- `h,j,k,l` (or arrow keys) to select text in file
- `d` delete selection
- `y` yank to clipboard (not to system clipboard to nvim clipboard, its a bit confusing at first)
- (more coming soon im still learning vim)

![image](https://github.com/mikkurogue/tmux.config/assets/5637842/7f0413cb-4530-4496-b025-9ebbb0c04e7d)
