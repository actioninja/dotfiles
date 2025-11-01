-- KEYMAPPINGS
--some utility bindings
local keymap = vim.keymap.set
local opt = function (description, expression, replace)
  local opts = { silent = true }
  if description then
    opts.desc = description
  end
  if expression then
    opts.expr = expression
  end
  if expression and replace ~= nil then
    opts.replace_keycodes = replace
  end
  return opts
end
local bindpartial = function (mode) return function (sequence, binding, description, expression, replace) keymap(mode, sequence, binding, opt(description, expression, replace)) end end
local bindnormal = bindpartial("n")
local bindinsert = bindpartial("i")
-- x covers both block and standard visual mode
local bindvisual = bindpartial("x")
local bindterm = bindpartial("t")
local bindcommand = bindpartial("c")
-- binds for both visual and normal mode
local bindnx = bindpartial({ "n", "x" })

--remap space as leader key
vim.g.mapleader = " "

bindnormal("<Leader>g", ":grep<space>", "Grep")

--close all other splits
bindnormal("<Leader>o", ":only<cr>", "Close all other splits")

--lsp navigation
bindnormal("gD", vim.lsp.buf.declaration, "Go to declaration")
bindnormal("gd", vim.lsp.buf.definition, "Go to definition")
bindnormal("gi", vim.lsp.buf.implementation, "Go to implementation")
bindnormal("<Leader>f", vim.lsp.buf.format, "Format code")
bindnormal("K", vim.lsp.buf.hover, "Hover documetation")
bindnormal("<Leader>c", vim.lsp.buf.code_action, "Code action")

-- Diagnostic
bindnormal("<Leader>e", vim.diagnostic.open_float, "Floating diagnostic")
bindnormal("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
bindnormal("]d", vim.diagnostic.goto_next, "Next diagnostic")
bindnormal("gl", vim.diagnostic.setloclist, "Diagnostics on loclist")

bindnormal("gq", vim.diagnostic.setqflist, "Diagnostics on quickfix")

-- trick to always move by visible lines, ie move to next "fake" line from a wap
bindnx("j", [[v:count == 0 ? 'gj' : 'j']], "", true)
bindnx("k", [[v:count == 0 ? 'gk' : 'k']], "", true)

-- shamelessly taken from mini.basics, quick toggle various basics
local toggle_key = [[\]]
local bindtoggle = function(key, command, desc) bindnormal(toggle_key .. key, command, desc) end
bindtoggle('c', "<Cmd>setlocal cursorcolumn!<CR>", "Toggle cursorcolumn")
bindtoggle('C', "<Cmd>setlocal cursorline!<CR>", "Toggle cursorline")
bindtoggle('s', '<Cmd>setlocal spell!<CR>', "Toggle 'spell'")
bindtoggle('w', '<Cmd>setlocal wrap!<CR>', "Toggle 'wrap'")

-- move window focus with ctrl + hjkl
bindnormal("<C-H>", "<c-w>h", "Focus on left window")
bindnormal("<C-J>", "<c-w>j", "Focus on bottom window")
bindnormal("<C-K>", "<c-w>k", "Focus on top window")
bindnormal("<C-L>", "<c-w>l", "Focus on right window")

-- resize windows with ctrl + arrows
bindnormal('<C-Left>',  '"<Cmd>vertical resize -" . v:count1 . "<CR>"', "Increase window height", true, false) 
bindnormal('<C-Down>',  '"<Cmd>resize -"          . v:count1 . "<CR>"', "Decrease window height", true, false)
bindnormal('<C-Up>',    '"<Cmd>resize +"          . v:count1 . "<CR>"', "Increase window width", true, false)
bindnormal('<C-Right>', '"<Cmd>vertical resize +" . v:count1 . "<CR>"', "Decrease window width", true, false)

-- move cursor in insert and command mode with alt + hjkl
-- command mode only needs h and l, silent = false makes it immediate
keymap("c", "<M-h>", "<Left>", { silent = false })
keymap("c", "<M-l>", "<Right>", { silent = false })

-- allowing remap here makes sure that it behaves exactly as hjkl which matters for some stuff
keymap("i", "<M-h>", "<Left>", { noremap = false })
keymap("i", "<M-j>", "<Down>", { noremap = false })
keymap("i", "<M-k>", "<Up>", { noremap = false })
keymap("i", "<M-l>", "<Right>", { noremap = false })

bindterm("<M-h>", "<Left>", "Left")
bindterm("<M-j>", "<Down>", "Down")
bindterm("<M-k>", "<Up>", "Up")
bindterm("<M-l>", "<Right>", "Right")

-- copy and paste from global clipboard, + buffer
bindnx("gy", '"+y', "Yank to system clipboard")
bindnormal("gp", '"+p', "Paste from system clipboard")
-- trick to not yank the selection as you paste in visual mode
bindvisual("gp", '"+P', "Paste from system clipboard")

--sudohack
bindcommand("w!!", "w !sudo tee > /dev/null %", "Write as root")


