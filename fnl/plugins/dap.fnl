;all this does is load dap configurations
;
;the full directory name starting after the source (fnl) will be used
;replace all the /'s with periods and for each file in {source}/dap,
;set the modified path as a variable to require the file at the path
;
;ie: fnl/dap/adapters/lldb.fnl will run `dap.adapters.lldb = require'dap.adapters.lldb'`
;
;if you really want to (or are lazy) you can use lua/dap/{whatever}, but make sure a fennel file
;wont override it

(tset _G :dap (require :dap))
(local dir (.. (vim.fn.stdpath :config) "/lua/"))
(local search (io.popen (.. "find " dir "dap/ -name '*.*'")))
(each [conf (search:lines)]
  (local path (string.gsub conf "/" "."))
  (local req (path:sub (+ (# dir) 1) -5))
  ((assert (load (.. req " = require'" req "'")))))

((. (require :dap-python) :setup) :python3)
