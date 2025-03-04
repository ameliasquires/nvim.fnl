{
:enable (fn []
  (tset vim.opt :number false)
  (tset vim.o :signcolumn :no)
  (tset vim.opt :fillchars {:eob " "})
  (tset vim.opt :wrap true)
  (tset vim.opt :linebreak true)
  (_G.opt.trans-enable))

:disable (fn []
  (tset vim.opt :number true)
  (tset vim.o :signcolumn :yes)
  (tset vim.opt :fillchars {:eob "~"})
  (tset vim.opt :wrap false)
  (tset vim.opt :linebreak false)
  (_G.opt.trans-disable))
}
