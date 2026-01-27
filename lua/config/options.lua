-- This file is automatically loaded by LazyVim
-- Use it to set vim options and behavior

--------------------------------------------------
-- LazyVim globals
--------------------------------------------------
vim.g.autoformat = false
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- LazyVim root dir detection
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Hide deprecation warnings
vim.g.deprecation_warnings = false

-- LSP defaults
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"

-- Python provider configuration (properly disable if not needed)
-- Comment out the next line if you want to use python provider
-- vim.g.loaded_python3_provider = 0
vim.g.python3_host_prog = vim.fn.expand("~/.venvs/nvim/bin/python")


--------------------------------------------------
-- General options
--------------------------------------------------
local opt = vim.opt

opt.autowrite = false
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.laststatus = 3
opt.list = true
opt.mouse = "a"
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 4
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true
opt.shiftwidth = 4
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.tabstop = 4
opt.softtabstop = 4
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = false
opt.textwidth = 130

--------------------------------------------------
-- Folding (ufo / treesitter friendly)
--------------------------------------------------
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

--------------------------------------------------
-- C / C++ behavior
--------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "cc", "cxx", "h", "hpp" },
    callback = function()
        -- Indentation
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = true
        vim.opt_local.softtabstop = 4

        vim.opt_local.cindent = true
        vim.opt_local.autoindent = true
        vim.opt_local.smartindent = false

        -- Allman / BSD style
        vim.opt_local.cinoptions = "f0,{0,}0,t0,+4,:0,=0,l1,b0,g0,h4,N-s,(0,w1,m1,j1,J1,W4,M0,p4,i4,c4,C1,/0,u0,U1"

        vim.opt_local.textwidth = 100
        vim.opt_local.formatoptions = "croqnj"
        vim.opt_local.commentstring = "// %s"

        -- Keymaps
        local keymap = vim.keymap.set
        local opts = { buffer = true, silent = true, desc = "C/C++ specific commands" }

        keymap("n", "<leader>cc", ":!gcc -Wall -Wextra -std=c99 -o %:r %<CR>", opts)
        keymap("n", "<leader>cr", ":!./%:r<CR>", opts)
    end,
})

--------------------------------------------------
-- Extra per-filetype tweaks
--------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt_local.spell = false
    end,
})
