(var capabilities (require :cmp_nvim_lsp))
(set capabilities (capabilities.default_capabilities))
(local lsp _G.settings.lsp)
(local config_table {
  :lua_ls {:settings {:Lua {:diagnostics {:disable
    ["lowercase-global" "trailing-space" "unused-local"]}}}}
  })
(local lspconfig (_G.util.require! :lspconfig))

(each [language (lsp:gmatch "([^,]+)")]
    (when (= (. config_table language) nil) (tset config_table language {}))
    (tset (. config_table language) :capabilities capabilities)
    ((. (. lspconfig language) :setup) (. config_table language)))
