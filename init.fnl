(require-macros :hibiscus.packer)

(packer-setup! {})

(global settings (require :settings))

(when (~= (vim.fn.getenv :NVIM_DEBUG) :1)
  (require :keybinds)
  (require :defaults)
  (global opt (require :opt)))

(require :settings-ui)

(local util (require :util))
(tset _G :util util)

(packer!
  ;required for fennel slop
  (use! :udayvir-singh/hibiscus.nvim)
  (use! :udayvir-singh/tangerine.nvim)

  ;functionality stuff
  (use! :gelguy/wilder.nvim :require :plugins.wilder)
  (use! :folke/which-key.nvim :require :plugins.which_key)
  (use! :nvim-neo-tree/neo-tree.nvim :require :plugins.neo_tree
    :depends [:nvim-lua/plenary.nvim :nvim-tree/nvim-web-devicons
      :MunifTanjim/nui.nvim :3rd/image.nvim])
  (use! :sindrets/winshift.nvim :config (util.setup! :winshift))
  (use! :rcarriga/nvim-notify :config (util.setup! :notify {:background_colour "#000000"}))
  (use! :akinsho/toggleterm.nvim :require :plugins.toggleterm)
  (use! :nvim-telescope/telescope.nvim)
  (use! :matbme/JABS.nvim :require :plugins.jabs)
  (use! :CRAG666/code_runner.nvim :config (util.setup! :code_runner))
  (use! :sindrets/diffview.nvim)
  (use! :stevearc/oil.nvim :config (util.setup! :oil))
  ;use this to disable preview-tui
  ;(use! :luukvbaal/nnn.nvim :config (util.setup! :nnn {:offset true :picker {:fullscreen false}}))

  ;introduces too many erros:p cool otherwise, might find an altern--mostly covered by outline
  ;(use! :code-biscuits/nvim-biscuits :config (util.setup! :nvim-biscuits))

  (use! :michaelb/sniprun :run "sh ./install.sh" :require :plugins.sniprun)
  (use! :DNLHC/glance.nvim :config (util.setup! :glance))
  (use! :hedyhli/outline.nvim :config (util.setup! :outline {:keymaps  {:up_and_jump :<C-p> :down_and_jump :<C-n>}}))
  (use! :doctorfree/cheatsheet.nvim
    :depends [:nvim-telescope/telescope.nvim :nvim-lua/popup.nvim :nvim-lua/plenary.nvim]) 

  ;god forbid a girl have fun
  (use! :krady21/compiler-explorer.nvim :require :plugins.compiler_explorer)
 
  ;used for proper layouts (oh my god i love this so much i wanna kiss the dev on the lips)
  (use! :folke/edgy.nvim :require :plugins.edgy)

  ;latex
  (use! :jbyuki/nabla.nvim)

  ;i like this one, just has some issues and isnt that helpful
  ;(use! :wfxr/minimap.vim)
  
  ;make things pretty
  (use! :rachartier/tiny-inline-diagnostic.nvim :config (util.setup! :tiny-inline-diagnostic {:preset :minimal :signs {:arrow "  > "} :hi {:background ""} :options {:multilines {:enabled true}}}))
  (use! :nvim-lualine/lualine.nvim :require :plugins.lualine)
  (use! :max397574/startup.nvim :require :plugins.startup)
  (use! :lewis6991/gitsigns.nvim :config (util.setup! :gitsigns))
  (use! :stevearc/dressing.nvim :require :plugins.dressing)
  
  ;figure out if i want this one
  (use! :kwkarlwang/bufresize.nvim :config (util.setup! :bufresize))

  ;floating_mode
  (use! :Iron-E/nvim-libmodal)

  ;fix bracket pairing
  (use! :monkoose/matchparen.nvim :config (util.setup! :matchparen))

  ;debugging
  (use! :mfussenegger/nvim-dap :require :plugins.dap)
  (use! :rcarriga/nvim-dap-ui :depends [:nvim-neotest/nvim-nio] :config (util.setup! :dapui))
  (use! :mfussenegger/nvim-dap-python)
  (use! :Weissle/persistent-breakpoints.nvim :require :plugins.persistent_breakpoints)

  ;lsp
  (use! :nvim-treesitter/nvim-treesitter :require :plugins.treesitter)
  (use! :ray-x/lsp_signature.nvim :config (util.setup! :lsp_signature))
  (use! :hrsh7th/cmp-nvim-lsp)
  (use! :hrsh7th/nvim-cmp :require :plugins.cmp)
  (use! :neovim/nvim-lspconfig :require :plugins.lspconfig)
  (use! :williamboman/mason.nvim :config (util.setup! :mason))

  ;themes
  (use! :kepano/flexoki-neovim)
  (use! :kdheepak/monochrome.nvim)
  (use! :nyoom-engineering/oxocarbon.nvim)
  (use! :NTBBloodbath/doom-one.nvim)
  (use! :EdenEast/nightfox.nvim)
)
