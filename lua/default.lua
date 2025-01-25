vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("let g:netrw_liststyle = 3")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.cursorline = true
opt.relativenumber = true
opt.autoindent = true
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.wrap = true
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
vim.cmd([[let &shell = '"C:/Program Files/Git/bin/bash.exe"']])
vim.cmd([[let &shellcmdflag = '-s']])

-- keymap:
local keymap = vim.keymap

local function close_buffer()
	local current_buf = vim.api.nvim_get_current_buf() -- Buffer hiện tại
	local next_buf = vim.fn.bufnr("#") -- Buffer được truy cập trước đó

	if vim.api.nvim_buf_is_valid(next_buf) and vim.api.nvim_buf_is_loaded(next_buf) then
		vim.cmd("buffer " .. next_buf)
	else
		vim.cmd("bnext")
	end

	vim.cmd("bdelete " .. current_buf)
end

keymap.set("n", "<leader>bd", close_buffer)
keymap.set("n", "<C-t>", ":ToggleTerm name=Terminal<CR>")
keymap.set("t", "jk", [[<C-\><C-n>]])
keymap.set({ "i", "n", "v" }, "<C-s>", "<ESC>:w<CR>")
keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-j>", "<Down>")
keymap.set("i", "<C-k>", "<Up>")
keymap.set("i", "<C-l>", "<Right>")
keymap.set("i", "jk", "<ESC>")
keymap.set({ "n", "v" }, "<leader>qq", ":q!<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
