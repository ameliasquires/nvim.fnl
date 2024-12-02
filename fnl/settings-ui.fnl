(local options {
  :colorscheme {:array false :options [:oxocarbon :monochrome :doom-one]}
  :lsp {:array true}})

(local options_k {})
(each [k v (pairs options)] (table.insert options_k k))

(lambda startswith [arr str]
  (local end {})
  (each [_ a (pairs arr)]
    (when (= (a:sub 1 (# str)) str)
      (table.insert end a)))
  end)

(lambda trim [_str]
  (var str _str)
  (while (and (> (# str) 0) (= (str:sub 1 1) " ")) (set str (str:sub 2)))
  (while (and (> (# str) 0) (= (str:sub -1 -1) " ")) (set str (str:sub 1 -2)))
  str)

(lambda carray [str]
  (local word [])
  (each [w (str:gmatch "([^,]+)")] (table.insert word w))
  word)

(lambda tarray [arr]
  (var string "")
  (each [_ a (pairs arr)]
    (set string (.. string "," a)))
  string)

(vim.api.nvim_create_user_command "Settings"
  (fn [opts]
    (var (option item rest) (opts.args:match "(%w+)%s*(%w+)(.*)"))
    (var action 0) ; 0 = set, 1 = add, 2 = remove
    (case item
      (where n (= n "add")) (set action 1)
      (where n (= n "remove")) (set action 2))
    
    (when (= action 0) (tset _G.settings option (.. item " " rest)))
    (when (= action 1) (tset _G.settings option (.. (. _G.settings option) rest)))
    )
  {:nargs 1 :complete (fn [arglead cmdline]
    (local parsed [])
    (each [o (string.gmatch cmdline "%S+")] (table.insert parsed o))
    ;add an extra element when creating a new element
    (when (= (cmdline:sub -1) " ") (table.insert parsed " "))

    (case (# parsed)
      (where n (= n 2)) (startswith options_k arglead)
      (where n (and (= n 3) (?. options (. parsed 2) :array))) (startswith [:add :remove] arglead)
      (where n (and (= n 4) (?. options (. parsed 2) :array) (= (. parsed 3) :remove))) (startswith (carray (. _G.settings (. parsed 2))) arglead)

      (where n (and (>= n 3) (?. options (. parsed 2) :options)))
        ;only one for now, not sure what else i would add besides functions
        (case (type (. options (. parsed 2) :options))
          (where n (= n "table")) (startswith (. options (. parsed 2) :options) arglead))

    ))})
