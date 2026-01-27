return {
  {
    "3rd/image.nvim",
    lazy = false, -- 🔴 precisa estar carregado
    config = function()
      require("image").setup({
        backend = "kitty", -- ou "ueberzug", "wezterm", "sixel"
        integrations = {
          markdown = {
            enabled = true,
          },
          neorg = {
            enabled = true,
          },
        },
        max_width = 100,
        max_height = 40,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = true,
      })
    end,
  },
}

