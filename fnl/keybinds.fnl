(require-macros :hibiscus.vim)

(vim.opt.whichwrap:append {
  :< true
  :> true
  "[" true
  "]" true
  :h true
  :l true})

(map! [n] :<c-k> "<cmd>:wincmd k<CR>")
(map! [n] :<c-j> "<cmd>:wincmd j<CR>")
(map! [n] :<c-h> "<cmd>:wincmd h<CR>")
(map! [n] :<c-l> "<cmd>:wincmd l<CR>")

;; floating mode

(local libmodal (require :libmodal))

(local move_win (lambda [drow dcol]
  (local win (vim.api.nvim_win_get_config 0))
  (when (= win.relative "") (lua "return nil"))
  (tset win :row (+ win.row drow))
  (tset win :col (+ win.col dcol))
  (vim.api.nvim_win_set_config 0 win)))

(local resize_win (lambda [drow dcol]
  (local win (vim.api.nvim_win_get_config 0)) 
  (tset win :height (+ win.height drow))
  (tset win :width (+ win.width dcol))
  (vim.api.nvim_win_set_config 0 win)))


(local t (lambda []
  (local win (vim.api.nvim_win_get_config 0))
  (tset win :bufpos [0 100])
  (vim.api.nvim_win_set_config 0 win)))

(local aww (fn []
  (local keys {
   (vim.keycode :<c-j>) (fn [] (resize_win  2 0))
   (vim.keycode :<c-k>) (fn [] (resize_win -2 0))
   (vim.keycode :<c-h>) (fn [] (resize_win 0 -2))
   (vim.keycode :<c-l>) (fn [] (resize_win 0  2))

   :j (fn [] (move_win  2 0))
   :k (fn [] (move_win -2 0))
   :h (fn [] (move_win 0 -2))
   :l (fn [] (move_win 0  2))

    :d (fn [] (t))}) 

  (local float_mode (libmodal.mode.new :floating keys))
  (float_mode:enter)))

(map! [n] :<c-f> (fn [] (aww)))

;; exit terminal mode like a normal human
(map! [t] :<esc> "<C-\\><C-n>")

