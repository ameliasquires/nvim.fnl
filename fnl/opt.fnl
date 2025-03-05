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
      ;havent found how to make toggleterm to work, it wont switch until you select the window
      ;possible bug with toggleterm?
      (local groups [:Normal :NormalNC :Comment :Constant :Special :Identifier
                  :Statement :PreProc :Type :Underlined :Todo :String :Function
                  :Conditional :Repeat :Operator :Structure :LineNr :NonText
                  :SignColumn :CursorLine :CursorLineNr :StatusLine :StatusLineNC
                  :EndOfBuffer :NormalFloat :FloatBorder :NvimTreeNormal :TermCursor :TermCursorNC])
      (each [_ v (pairs groups)]
        (vim.api.nvim_set_hl 0 v {:bg :none :fg :none}))))

(global _trans_ false)

(fn trans-disable []
  (global _trans_ false)
  (vim.api.nvim_clear_autocmds {:event :Colorscheme})
  (vim.cmd (.. "colorscheme " _G.settings.colorscheme)))

(fn trans-enable []
  (global _trans_ true)
  (vim.api.nvim_create_autocmd "Colorscheme" {
    :pattern :*
    :callback color_change})
  (color_change)
  (vim.cmd (.. "colorscheme " _G.settings.colorscheme)))

(when (= _G.settings.trans "enable")
  (trans-enable))

(vim.cmd (.. "colorscheme " _G.settings.colorscheme))

(when (= (vim.fn.has :persistent_undo) 1) 
  (local target_path (vim.fn.expand "~/.undodir"))
  (when (not= (vim.fn.isdirectory target_path) 1)
    (vim.fn.mkdir target_path :p 0777))
  (tset vim.o :undodir target_path)
  (tset vim.o :undofile true))

(tset _G :current_layout "")
(when (and (not= _G.settings.layout "") (not= _G.settings.layout "none"))
  (util.after-setup (. (require (.. :layouts. _G.settings.layout)) :enable))
  (tset _G :current_layout _G.settings.layout))

{:trans-disable trans-disable :trans-enable trans-enable}
