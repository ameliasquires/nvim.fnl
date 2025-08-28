(local blink (_G.util.require! :blink.cmp))
(blink.setup {
  :keymap {
    :<Tab> [ :select_next :fallback ]
  }

  :cmdline {
    :enabled false
  }

  :completion {
    :documentation {
      :auto_show true
      :auto_show_delay_ms 350
    }
    :menu {
      :draw {
        :components {
          :label {
            :text (fn [ctx]
              ((. (require "colorful-menu") :blink_components_text) ctx))
            :highlight (fn [ctx]
              ((. (require "colorful-menu") :blink_components_highlight) ctx))
          }
        }
        :treesitter [ :lsp ]
      }
    }
    :list {
      :selection {
        :preselect false
      }
    }
  }

  :fuzzy {
    :implementation :lua
  }
})
