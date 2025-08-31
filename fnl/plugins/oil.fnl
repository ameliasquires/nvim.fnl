(local oil (_G.util.require! :oil))
;maybe use other one so dirs can show status
(local oil-git (_G.util.require! :oil-git))
(local oil-gitignore (require "lua.oil-gitignore"))

(oil.setup {
  :view_options {
                        ;heh, get it?
    :is_hidden_file (fn [en by]
      (local dir (oil.get_current_dir by))
      (. oil-gitignore.git_status dir :ignored en)
    )
  }

  :float {
    :padding 7
  }
})
(oil-git.setup)
