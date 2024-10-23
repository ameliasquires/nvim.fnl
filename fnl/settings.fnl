(local path (.. (vim.fn.stdpath :data) :/_owo_))

(lambda _get [_ key]
  (local file (io.open (.. path key) :rb))
  (when (= file nil) nil)

  (local value (file:read :*a))
  (io.close file)
  value)

(lambda _set [_ key value]
  (local file (io.open (.. path key) :w))
  (file:write value)
  (io.close file))

(setmetatable {} {:__index _get :__newindex _set})
