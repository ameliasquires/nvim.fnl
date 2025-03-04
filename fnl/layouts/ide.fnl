{
:enable (fn []
  (vim.cmd "ToggleTerm direction=horizontal")
  (vim.cmd "Neotree toggle")
  (vim.cmd "Outline"))

:disable (fn []
  (vim.cmd "ToggleTerm direction=horizontal")
  (vim.cmd "Neotree toggle")
  (vim.cmd "Outline"))
}
