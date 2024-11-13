new and improved neovim config in fennel for some reason

use responsibly

requires 

* neovim >= 0.10 (i think)

* find

to install, put this repo in ~/.config/nvim, run `NVIM_DEBUG=1 nvim` then run both :PackerInstall and :PackerCompile

to start out, press space for a window with common commands. try <space>li to setup a normal ide like layout

additionally <Ctrl>f can be used to enter "floating mode"
    - <Ctrl>{h,j,k,l} : resize in that direction
    - {h,j,k,l} : move window in that direction

in normal mode use <Ctrl>{h,j,k,l} to switch to the window in that direction

### configuration

#### lsp

to set what lsps you want to use use `:lua settings.lsp = "language"` where "language" is a comma seperated list of language servers. for a list checkout :help lspconfig-all

the default is "pyright,lua_ls,clangd,zls,csharp_ls,ts_ls,rust_analyzer"

#### colorscheme

set with `:lua settings.colorscheme = "colorscheme"`

defaults as "oxocarbon"
