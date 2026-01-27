-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Molten (Jupyter inside Neovim)

local map = vim.keymap.set

-- init kernel
map("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Molten Init" })

-- evaluate
map("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "Molten eval line" })
map("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>", { desc = "Molten eval visual" })
map("n", "<leader>mc", ":MoltenEvaluateOperator<CR>", { desc = "Molten eval operator" })

-- cell based (like Jupyter)
map("n", "<leader>mn", ":MoltenNext<CR>", { desc = "Molten next cell" })
map("n", "<leader>mp", ":MoltenPrev<CR>", { desc = "Molten prev cell" })
map("n", "<leader>me", ":MoltenEvaluateCell<CR>", { desc = "Molten eval cell" })

-- outputs
map("n", "<leader>mo", ":MoltenOpenOutput<CR>", { desc = "Molten open output" })
map("n", "<leader>mh", ":MoltenHideOutput<CR>", { desc = "Molten hide output" })
map("n", "<leader>md", ":MoltenDelete<CR>", { desc = "Molten delete cell" })

-- restart / interrupt
map("n", "<leader>mr", ":MoltenRestart!<CR>", { desc = "Molten restart kernel" })
map("n", "<leader>ms", ":MoltenInterrupt<CR>", { desc = "Molten stop kernel" })

