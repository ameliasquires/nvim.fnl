(local blink (_G.util.require! :blink.cmp))
(blink.setup {
  :keymap {
    :<Tab> [ :select_next :fallback ]
  }

  :completion {
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
