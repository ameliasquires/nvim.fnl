(local colors {
  :bg :#252629
  :fade-bg :#121314
  :yellow :#ECBE7B
  :cyan :#008080
  :darkblue :#081633
  :green :#98be65
  :orange :#FF8800
  :violet :#a9a1e1
  :magenta :#c678dd
  :blue :#51afef
  :red :#ec5f67
  :grey :#6a6a6a
})

(macro color [code]
  {:fg code})

(lambda table-to-pair [table]
  (var idx 1)
  (var out {})
  (while (not= (. table (+ idx 1)) nil)
    (tset out (. table idx) (. table (+ idx 1)))
    (set idx (+ idx 2)))
  out)


(fn add [section mod col ...]
  (var opt (table-to-pair [...]))
  (when (= opt nil) (set opt {}))
  (tset opt 1 mod)
  (tset opt :color col)
  (table.insert section opt))

(local a [])
(local b [])
(local c [])
(local x [])
(local y [])
(local z [])

(local inactive-a [])
(local inactive-b [])
(local inactive-c [])
(local inactive-x [])
(local inactive-y [])
(local inactive-z [])

(add c :filesize (color colors.red))
(add c :filename (color colors.magenta))
(add c :diagnostics)

(add c :branch (color colors.cyan) :icon "" :fmt (fn [s] (.. "(" s ")")))
(add c :diff)

(add x :searchcount (color colors.cyan))
(add x :location (color colors.grey))
(add x :progress (color colors.grey))

(add inactive-c :filesize (color colors.grey))
(add inactive-c :filename (color colors.grey))
(add inactive-c :diagnostics (color colors.grey))

(add inactive-x :progress (color colors.grey))


(_G.util.setup! :lualine {
  :options {
    :theme {
      :normal { :c {:bg colors.bg}} 
      :inactive { :c {:bg colors.fade-bg}} 
    }
    :component_separators { :left "" :right "" }                         
    :section_separators { :left "" :right  "" }
  }
  :sections {
    :lualine_a a
    :lualine_b b 
    :lualine_c c
    :lualine_x x
    :lualine_y y
    :lualine_z z 
  }
  :inactive_sections {
    :lualine_a inactive-a
    :lualine_b inactive-b 
    :lualine_c inactive-c
    :lualine_x inactive-x
    :lualine_y inactive-y
    :lualine_z inactive-z
  }
})
