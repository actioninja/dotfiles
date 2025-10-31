local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--system clipboard
vim.opt.clipboard = "unnamedplus"
--cmp junk
vim.opt.completeopt = { "menuone", "noselect" }
--no concealment (`` in md)
vim.opt.conceallevel = 0

-- UI --
--allow usage of mouse
vim.opt.mouse = "a"
--popup menu height
vim.opt.pumheight = 10
--hide mode view
vim.opt.showmode = false
--highlight the current cursor line
vim.opt.cursorline = true
--enable line numbers
vim.opt.number = true
--enable relative line numbers|being set as well as "number" causes current line to be absolute and the rest to be relative
vim.opt.relativenumber = true
--hide partial cmd in last line of screen
vim.opt.showcmd = false
--hide line and column number in bottom right
vim.opt.ruler = false
--minimum width of number column
vim.opt.numberwidth = 4
--scroll offset buffer
vim.opt.scrolloff = 8
--scroll offset buffer horizontally
vim.opt.sidescrolloff = 8
--bigger cmd bar
vim.opt.cmdheight = 1

-- SPLITS --
--horizontal splits go below
vim.opt.splitbelow = true
--vertical splits go right
vim.opt.splitright = true

-- SEARCHING --
--highlight all matches in search
vim.opt.hlsearch = true
--dont ignore case if capitals is used
vim.opt.smartcase = true
--ignore case in search
vim.opt.ignorecase = true

-- FILE MANAGEMENT --
--no backup file
vim.opt.backup = false
--dont create a swapfile
vim.opt.swapfile = false
--do not attempt to edit file current being edited
vim.opt.writebackup = false
--enable persistent undo
vim.opt.undofile = true
--write files in UTF-8
vim.opt.fileencoding = "utf-8"

-- TIMINGS --
--timeout key sequences
vim.opt.timeout = true
--timeout length
vim.opt.timeoutlen = 300
--faster completion popup
vim.opt.updatetime = 300

-- TABS --
--make indenting smarter
vim.opt.smartindent = true
--convert tabs to spaces
vim.opt.expandtab = true
--4 space wide tabs
vim.opt.tabstop = 4
--shift width for indentation|"0" causes this value to reference tabstop
vim.opt.shiftwidth = 0
--shift width for soft tabbing|"0" causes this value to reference tabstop
vim.opt.softtabstop = 0
--automatically adjust tabstop for some filetypes
augroup("two_space_tab", { clear = true })
autocmd("Filetype", {
  group = "two_space_tab",
  pattern = {
    "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "json", "yaml", "lua", "nix", "haskell"
  },
  command = "setlocal tabstop=2"
})

--ripgrep instead of grep
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- OTHER STUFF --
vim.g.editorconfig = true

-- neovide settings
if vim.g.neovide then
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.opt.guicursor = {
    "n-v-c:block-blinkwait700-blinkon400-blinkoff250",  -- Normal, Visual, Command-line: block cursor, blinking
    "i-ci-ve:ver25-blinkwait700-blinkon400-blinkoff250", -- Insert, Command-line insert, Visual-excl: vertical bar blinking
    "r-cr:hor20",  -- Replace modes: horizontal bar
    "o:hor50"      -- Operator-pending mode
  }
end

