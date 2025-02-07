(local util (require :util))

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

(local color_change (fn [] 
      (vim.api.nvim_set_hl 0 :Normal {:bg :none})
      (vim.api.nvim_set_hl 0 :SignColumn {:bg :none})
      (vim.api.nvim_set_hl 0 :EndOfBuffer {:bg :none})
      (vim.api.nvim_set_hl 0 :NormalFloat {:bg :none})
      (vim.api.nvim_set_hl 0 :FloatBorder {:bg :none})))

(when (= _G.settings.trans "enable")
  (vim.api.nvim_create_autocmd "Colorscheme" {
    :pattern :*
    :callback color_change})
  (color_change))

(vim.cmd (.. "colorscheme " _G.settings.colorscheme))

(when (= (vim.fn.has :persistent_undo) 1) 
  (local target_path (vim.fn.expand "~/.undodir"))
  (when (not= (vim.fn.isdirectory target_path) 1)
    (vim.fn.mkdir target_path :p 0777))
  (tset vim.o :undodir target_path)
  (tset vim.o :undofile true))

(when (not= _G.settings.layout "")
  (util.after-setup (require (.. :layouts. _G.settings.layout))))
