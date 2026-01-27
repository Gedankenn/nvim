return {
  {
    "benlubas/molten-nvim",
        lazy = false,
    build = ":UpdateRemotePlugins",
    dependencies = {
      "3rd/image.nvim",
    },
    init = function()
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true

      -- images
      vim.g.molten_image_provider = "image.nvim"

      -- jupyter style behavior
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_use_border_highlights = true
      vim.g.molten_auto_image_popup = true
    end,
  },

  {
    "3rd/image.nvim",
    opts = {
      backend = "ueberzug", -- or "kitty", "wezterm"
      integrations = {
        molten = true,
      },
      max_width = 100,
      max_height = 20,
      max_height_window_percentage = 50,
      max_width_window_percentage = 50,
    },
  },
}

