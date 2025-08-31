--https://github.com/stevearc/oil.nvim/blob/master/doc/recipes.md#hide-gitignored-files-and-show-git-tracked-hidden-files

local M = {}

-- helper function to parse output
function M.parse_output(proc)
  local result = proc:wait()
  local ret = {}
  if result.code == 0 then
    for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
      -- Remove trailing slash
      line = line:gsub("/$", "")
      ret[line] = true
    end
  end
  return ret
end

-- build git status cache
function M.new_git_status()
  return setmetatable({}, {
    __index = function(self, key)
      local ignore_proc = vim.system(
        { "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
        {
          cwd = key,
          text = true,
        }
      )
      local tracked_proc = vim.system({ "git", "ls-tree", "HEAD", "--name-only" }, {
        cwd = key,
        text = true,
      })
      local ret = {
        ignored = M.parse_output(ignore_proc),
        tracked = M.parse_output(tracked_proc),
      }

      rawset(self, key, ret)
      return ret
    end,
  })
end
M.git_status = M.new_git_status()

-- Clear git status cache on refresh
M.refresh = require("oil.actions").refresh
M.orig_refresh = M.refresh.callback
M.refresh.callback = function(...)
  git_status = M.new_git_status()
  M.orig_refresh(...)
end

return M
