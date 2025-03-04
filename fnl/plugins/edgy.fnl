(_G.util.setup! :edgy {
  :options {
    :bottom {:size 9}
  }
  :bottom [:toggleterm]
  :left [:neo-tree {:ft :Outline :title (fn []
          (local buf_name (vim.api.nvim_buf_get_name 0)); or "[No Name]"
          (vim.fn.fnamemodify buf_name ":t")
        )}]

  :animate {:enabled false}
  ;allow other window movement binds to 'work'
  :keys {:c-j (fn [win]
      (win:next {:focus true :pinned false}))
    :c-k (fn [win]
      (win:prev {:focus true :visible true}))}
  :wo {:winbar false}})	
