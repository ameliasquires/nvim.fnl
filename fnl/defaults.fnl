(lambda default [key value ?force]
  (when (or (= (. _G.settings key) nil) ?force) (tset _G.settings key value)))

(global defaults (lambda [force]
  (default :layout "" force)
  (default :colorscheme :carbonfox force)
  (default :lsp "pyright,lua_ls,clangd,zls,csharp_ls,ts_ls,rust_analyzer" force)))

(defaults false)
