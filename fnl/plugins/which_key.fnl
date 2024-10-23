(local whichkey (require :which-key))
(whichkey.setup)

(local mappings {
  1 {1 " f" 2 "<cmd>Neotree toggle<CR>" :desc "fs"}
  2 {1 " w" 2 "<cmd>WinShift<CR>" :desc "win shift"}
  3 {1 " t" 2 "<cmd>ToggleTerm direction=horizontal<CR>" :desc "hterm"}

  :mode [:n :v]
  :silent true
  :noremap true
  :nowait true})

(whichkey.add mappings)
