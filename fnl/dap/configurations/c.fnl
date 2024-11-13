[{
  :name "Launch"
  :type "lldb"
  :request "launch"
  :program (fn [] (vim.fn.input "Path to executable" (.. (vim.fn.getcwd) "/") "file")) 
  :cwd "${workspaceFolder}"
  :stopAtBeginningOfMainSubprogram false}]
