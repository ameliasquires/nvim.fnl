((. (require :neo-tree) :setup) {
  :close_if_last_window true
  :default_component_configs {
    :git_status {
      :symbols {
        :added :+
        :modified :m
        :deleted :x
        :renamed :->

        :untracked " "
        :ignored " "
        :unstaged :*
        :staged " "
        :conflict ":("}}}
  :window {
    :position :left
    :width 30}
  :filesystem {
    :use_libuv_file_watcher true}})
