return function(_, opts)
  local notify = require "notify"
  notify.setup(vim.tbl_extend('keep', {
    -- other stuff
    background_colour = "#000000"
  }, opts))
  vim.notify = notify
end
