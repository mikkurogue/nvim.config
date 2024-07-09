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
