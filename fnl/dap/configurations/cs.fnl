[{
  :type "coreclr"
  :name "launch - netcoredbg"
  :request "launch"
  :program (fn [] (vim.fn.input "path to dll" (.. (vim.fn.getcwd) "/bin/Debug/") "file"))}] 
