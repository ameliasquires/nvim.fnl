(local M {})
(tset _G :loaded {})

(tset M :require! (lambda [name]
  (local (ok req) (pcall require name))
  (when ok
    (tset _G.loaded name req)
    (. _G.loaded name))))

(tset M :setup! (lambda [name ?config]
  ;(tset _G.loaded :name ((. (require name) :setup) (or ?config {})))))
  (local req (M.require! name))
  (when (~= req nil)
    ((. (M.require! name) :setup) (or ?config {})))))

M
