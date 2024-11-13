(local cmp (_G.util.require! :cmp))

(cmp.setup {
  :snippet {
    :expand (fn [args] 
      (vim.snippet.expand args.body)
      ;((. vim.fn "vsnip#anonymous") args.body) ;for older neovim version (< 0.10)
    )}
  :mapping (cmp.mapping.preset.insert {
    :<C-b> (cmp.mapping.scroll_docs -4)
    :<C-f> (cmp.mapping.scroll_docs 4)
    :<C-Space> (cmp.mapping.complete)
    :<C-e> (cmp.mapping.abort)
    :<CR> (cmp.mapping.confirm {select true})
    :<Tab> (cmp.mapping (cmp.mapping.select_next_item) [:i :s])
  })
  :sources (cmp.config.sources [
    {:name :nvim_lsp}
    {:name :calc} ;to anyone new to this codebase, calc is short for calculator (no clue what this adds, but its funny)
    ] [{:name :buffer}])
  })


