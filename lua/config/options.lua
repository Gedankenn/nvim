-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ~/.config/nvim/lua/config/options.lua
-- This file is automatically loaded by LazyVim
-- Add this to disable LSP formatting
vim.g.autoformat = false
-- ~/.config/nvim/lua/config/options.lua
-- This file is automatically loaded by LazyVim

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
-- General Settings
opt.autowrite = false -- Disable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent (changed to 4)
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = false -- Disable automatic smart indenting
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for (changed to 4)
opt.softtabstop = 4 -- Number of spaces for tab in insert mode (added)
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
opt.textwidth = 130

-- Folding
opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value
opt.foldlevelstart = 99
opt.foldenable = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Hide deprecation warnings
vim.g.deprecation_warnings = false

-- LSP Server to use for Python
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"

-- C/C++ specific indentation and formatting settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp", "cc", "cxx" },
  callback = function()
    -- Indentation settings
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    vim.opt_local.softtabstop = 4
    
    -- Enable C indentation for proper brace placement
    vim.opt_local.cindent = true
    vim.opt_local.smartindent = false
    vim.opt_local.autoindent = false
    
    -- C indentation options for function braces on new lines (Allman/BSD style)
    vim.opt_local.cinoptions = {
      "f0",     -- First opening brace of a function on column 0
      "{0",     -- Opening braces in column 0
      "}0",     -- Closing braces in column 0
      "t0",     -- Function return type at column 0
      "+4",     -- Continuation lines indented 4 spaces
      ":0",     -- Case labels at same level as switch
      "=0",     -- Case statements alignment
      "l1",     -- Align with case label instead of statement after it
      "b0",     -- Align final "break" with case
      "g0",     -- C++ scope declarations at column 0
      "h4",     -- Statements after C++ scope declarations indented 4 spaces
      "N-s",    -- Don't indent inside namespaces
      "(0",     -- Line up with next non-white character after unclosed parentheses
      "w1",     -- Align with character after "if("
      "m1",     -- Align closing parenthesis with opening parenthesis line
      "j1",     -- Java anonymous classes
      "J1",     -- JavaScript object declarations
      "W4",     -- When in unclosed parentheses, line up with first character
      "M0",     -- Don't indent non-first line of multi-line condition
      "p4",     -- K&R-style function parameters
      "i4",     -- Indent for C++ base class declarations
      "c4",     -- Comment line alignment (4 spaces)
      "C1",     -- Don't indent comments starting at column 1
      "/0",     -- Don't indent comments
      "u0",     -- Same as (0 but for one level deeper
      "U1",     -- Don't ignore indent for function arguments
    }
    
    -- Additional C/C++ settings
    vim.opt_local.textwidth = 100
    vim.opt_local.formatoptions = "croqnj"
    vim.opt_local.commentstring = "// %s"
    
    -- Set up some useful keymaps for C/C++
    local keymap = vim.keymap.set
    local opts = { buffer = true, silent = true }
    
    -- Quick compilation (adjust command as needed)
    keymap("n", "<leader>cc", ":!gcc -Wall -Wextra -std=c99 -o %:r %<CR>", opts)
    keymap("n", "<leader>cr", ":!./%:r<CR>", opts)
  end,
})

-- Auto-formatting on save is disabled
-- If you want to format manually, use :Format command or set up a keymap

-- Additional settings for better C/C++ development
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    -- Enable spell checking in comments
    vim.opt_local.spell = false -- Set to true if you want spell checking
    
    -- Set up better syntax highlighting
    vim.cmd([[
      syntax match cCustomParen "(" contains=cParen
      syntax match cCustomBracket "\[" contains=cBracket
      syntax match cCustomBrace "{" contains=cBrace
    ]])
  end,
})

-- Make sure file type detection works properly
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.h" },
  callback = function()
    vim.bo.filetype = "c"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.hpp", "*.hxx", "*.hh" },
  callback = function()
    vim.bo.filetype = "cpp"
  end,
})
