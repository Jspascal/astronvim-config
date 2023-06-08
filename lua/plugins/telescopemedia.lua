return {
  "nvim-telescope/telescope-media-files.nvim",
  lazy = false,
  priority = 1000,
  media_files = {
    -- filetypes whitelist
    -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    filetypes = { "png", "webp", "jpg", "jpeg" },
    -- find command (defaults to `fd`)
    find_cmd = "fd"
  }
}
