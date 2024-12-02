(local whichkey (_G.util.require! :which-key))
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
  (wmap :d "<cmd>Glance references<CR>" "references")
  (wmap :s "<cmd>Telescope live_grep<CR>" "search")
  (wmap :z "<cmd>Telescope find_files<CR>" "open file")
  (wmap :b "<cmd>JABSOpen<CR>" "buffers")
  (wmap :g (fn []
    (local buffer (vim.fn.expand :%))
    (vim.cmd "w") ;write so location is updated
    (vim.cmd "tabe")
    (vim.cmd (.. "buffer " buffer))
    ((. (require "dapui") :open))) "dap-ify")
  (wmap :x "<cmd>tabclose<CR>" "close tab")
  (wmap :c (fn []
    (_G.loaded.edgy.goto_main)
    (vim.cmd "DiffviewOpen")) "git diff")

  ;;layouts
  (gmap :l "layout")
  (wmap :li (require :layouts.ide) "ide")
  (wmap :lq (require :layouts.quiet) "quiet")

  ;;visual
  (gmap :v "visual")
  (wmap :vl "<cmd>lua require('nabla').toggle_virt({autogen=true})<CR>" "latex")
  (wmap :vb "<cmd>lua require('nvim-biscuits').toggle_biscuits()<CR>" "biscuits")
  
  ;;quick
  (gmap :q "quick")
  (wmap :qs "\"+y" "system grab")
  (wmap :ql "0v$" "line")
  (wmap :qr "<cmd>SnipRun<CR>" "run highlighted")
  (wmap :qf "<cmd>RunFile<CR>" "run file")
  (wmap :qe "<cmd>RunCode<CR>" "run code")
  ])

(tset mappings :mode [:n :v])
(tset mappings :silent true)
(tset mappings :noremap true)
(tset mappings :nowait true)


(whichkey.add mappings)
