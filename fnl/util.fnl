(local M {})
(tset _G :loaded {})

(tset M :require! (lambda [name]
  (tset _G.loaded name (require name))
  (. _G.loaded name)))

(tset M :setup! (lambda [name ?config]
  ;(tset _G.loaded :name ((. (require name) :setup) (or ?config {})))))
  ((. (M.require! name) :setup) (or ?config {}))))

M
