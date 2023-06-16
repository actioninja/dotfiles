-- KEYMAPPINGS
--some utility bindings
local keymap = vim.keymap.set
local opt = function (description) return { silent = true, desc = description } end
local bindpartial = function (mode) return function (sequence, binding, description) keymap(mode, sequence, binding, opt(description)) end end
local bindnormal = bindpartial("n")
local bindinsert = bindpartial("i")
local bindvisual = bindpartial("v")
local bindvisualblock = bindpartial("x")
local bindterm = bindpartial("t")
local bindcommand = bindpartial("c")

--remap space as leader key
vim.g.mapleader = " "

--grep
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

--sudohack
bindcommand("w!!", "w !sudo tee > /dev/null %", "Write as root")

function add_sign(name, text)
  vim.fn.sign_define(name, { text = text, texthl = name, numhl = name})
end

add_sign("DiagnosticSignError", " ")
add_sign("DiagnosticSignWarn", " ")
add_sign("DiagnosticSignHint", " ")
add_sign("DiagnosticSignInfo", " ")

