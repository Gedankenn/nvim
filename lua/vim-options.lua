vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Create new terminal
vim.keymap.set('n', '<leader>te', ':split | terminal<CR>')


vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

