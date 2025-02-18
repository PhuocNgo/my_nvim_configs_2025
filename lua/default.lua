vim.cmd("set tabstop=2")
vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("let g:netrw_liststyle = 3")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.scrolloff = 999
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
opt.shell = '"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"'
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

	vim.cmd("bdelete! " .. current_buf)
end

keymap.set("n", "<leader>bd", close_buffer)
keymap.set("t", "jk", [[<C-\><C-n>]])
keymap.set({ "i", "n", "v" }, "<C-s>", "<ESC>:w<CR>")
keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-j>", "<Down>")
keymap.set("i", "<C-k>", "<Up>")
keymap.set("i", "<C-l>", "<Right>")
keymap.set("i", "jk", "<ESC>")
keymap.set({ "n", "v" }, "<leader>qq", ":q!<CR>")
-- move lines:
keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

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

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
	pattern = "*",
	command = "normal! zz",
})

keymap.set("n", "j", "jzz", { noremap = true, silent = true })
keymap.set("n", "k", "kzz", { noremap = true, silent = true })
keymap.set("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap.set("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
