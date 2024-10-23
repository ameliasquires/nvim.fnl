(require-macros :hibiscus.packer)

(packer-setup! {})

(global settings (require :settings))

(require :keybinds)
(require :defaults)
(require :opt)

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
  (use! :sindrets/winshift.nvim :require :plugins.winshift)
  (use! :rcarriga/nvim-notify :require :plugins.notify)
  (use! :akinsho/toggleterm.nvim :require :plugins.toggleterm)

  ;floating_mode
  (use! :Iron-E/nvim-libmodal)

  ;fix bracket pairing
  (use! :monkoose/matchparen.nvim :require :plugins.matchparen)

  ;lsp
  (use! :nvim-treesitter/nvim-treesitter :require :plugins.treesitter)
  (use! :ray-x/lsp_signature.nvim :require :plugins.lsp_signature)
  (use! :hrsh7th/cmp-nvim-lsp)
  (use! :hrsh7th/nvim-cmp :require :plugins.cmp)
  (use! :neovim/nvim-lspconfig :require :plugins.lspconfig)

  ;themes
  (use! :kdheepak/monochrome.nvim)
  (use! :nyoom-engineering/oxocarbon.nvim)
  (use! :NTBBloodbath/doom-one.nvim)
)
