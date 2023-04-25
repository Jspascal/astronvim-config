for _, source in ipairs {
  "astronvim.bootstrap",
  "astronvim.options",
  "astronvim.lazy",
  "astronvim.autocmds",
  "astronvim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

-- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- vim.cmd.colorscheme "catppuccin-macchiato"

if astronvim.default_colorscheme then
  require("catppuccin").setup({
    flavour = "macchiato", 
    background = { 
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
   
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        
    }, 
  })

  vim.cmd.colorscheme "catppuccin-macchiato"
end

require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)

require("packages")
