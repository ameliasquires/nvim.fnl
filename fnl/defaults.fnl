(lambda default [key value ?force]
  (when (or (= (. _G.settings key) nil) ?force) (tset _G.settings key value)))

(lambda defaults [force]
  (default :colorscheme :oxocarbon force)
  (default :lsp "lua_ls,clangd,zls,csharp_ls,ts_ls" force))

(defaults false)
