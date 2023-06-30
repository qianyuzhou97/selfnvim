local set = vim.o
set.relativenumber = true
set.number = true
set.clipboard = "unnamed"
set.updatetime = 200

-- hightlight the copy
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})

-- keybindings
vim.g.mapleader = " "
local opt = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>l", "<C-w>l", opt)
vim.keymap.set("n", "<leader>k", "<C-w>k", opt)
vim.keymap.set("n", "<leader>h", "<C-w>h", opt)
vim.keymap.set("n", "<leader>j", "<C-w>j", opt)
vim.keymap.set("n", "<leader>o", "<C-w>o", opt)
vim.keymap.set("n", "<leader>c", "<C-w>c", opt)
vim.keymap.set("n", "<leader>p", "<C-w>p", opt)

vim.api.nvim_set_keymap("n", "sl", ":set splitright<CR>:vsplit<CR>", {})
vim.api.nvim_set_keymap("n", "sh", ":set nosplitright<CR>:vsplit<CR>", {})
vim.api.nvim_set_keymap("n", "sk", ":set nosplitbelow<CR>:split<CR>", {})
vim.api.nvim_set_keymap("n", "sj", ":set splitbelow<CR>:split<CR>", {})

-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
vim.cmd("colorscheme base16-gruvbox-dark-soft")
