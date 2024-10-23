(local whichkey (require :which-key))
(whichkey.setup)

(macro wmap [k op desc]
  {1 (.. " " k) 2 op :desc desc})
(macro gmap [k group]
  {1 (.. " " k) :group group})

(local mappings [
  ;;common
  (wmap :f "<cmd>Neotree toggle<CR>" "fs")
  (wmap :w "<cmd>WinShift<CR>" "win shift")
  (wmap :t "<cmd>ToggleTerm direction=horizontal<CR>" "hterm")
  
  ;;quick
  (gmap :q "quick")
  (wmap :qs "\"+y" "system grab")
  (wmap :ql "0v$" "line")
  ])

(tset mappings :mode [:n :v])
(tset mappings :silent true)
(tset mappings :noremap true)
(tset mappings :nowait true)


(whichkey.add mappings)
