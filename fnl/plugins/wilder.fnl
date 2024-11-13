;trans colors :3
(local gradient [:#74d7ec :#96cde2 :#b9c3d9 :#dcb9d0 :#ffafc7 :#ffafc7 :#fec1d2 :#fdd4de 
  :#fce6e9 :#fbf9f5 :#fbf9f5 :#fce8ea :#fdd7e0 :#fec6d5 :#ffb5cb :#ffb5cb :#dcbdd2 :#b9c5da
  :#96cde2 :#73d5ea])

(local wilder (_G.util.require! :wilder))
(wilder.setup {:modes [:: :/ :?]})

;this like 'builds' the gradient? idk
(each [i fg (ipairs gradient)]
  (tset gradient i 
    (wilder.make_hl (.. :WilderGradient i) :Pmenu [{:a 1} {:a 1} {:foreground fg}])))

(wilder.set_option :renderer (wilder.wildmenu_renderer {
  :separator " . "
  :left [" "]
  :right [" "]

  :highlights {:gradient gradient}

  :highlighter (wilder.highlighter_with_gradient [
    (wilder.basic_highlighter)])}))
