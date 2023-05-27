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
polish = function()
  require("notify").setup({
  background_colour = "#1a1b26",
  })
  end

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
require('nvim-ts-autotag').setup()
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)

require('neoscroll').setup()
require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)

require("packages")
