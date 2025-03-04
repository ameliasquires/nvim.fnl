{
:enable (fn []
  (tset vim.opt :number false)
  (tset vim.o :signcolumn :no)
  (tset vim.opt :fillchars {:eob " "}))

:disable (fn []
  (tset vim.opt :number true)
  (tset vim.o :signcolumn :yes)
  (tset vim.opt :fillchars {:eob "~"}))
}
