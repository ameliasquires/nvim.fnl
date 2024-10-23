(tset vim.opt :wrap false)
(tset vim.opt :linebreak false)

(tset vim.opt :tabstop 2)
(tset vim.opt :shiftwidth 2)
(tset vim.bo :softtabstop 2)
(tset vim.opt :expandtab true)

(tset vim.opt :number true)
(tset vim.o :signcolumn :yes)
(tset vim.opt :termguicolors true)
;--vim.opt.fillchars = { eob = ""}
(vim.cmd (.. "colorscheme " _G.settings.colorscheme))
