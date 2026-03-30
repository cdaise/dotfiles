-- options
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.tabstop = 1
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.showmatch = true
vim.o.winborder = "rounded"
vim.o.signcolumn = "yes"
vim.o.cmdheight = 1
vim.o.showmode = false
vim.o.laststatus = 3
vim.opt.path:append("**")
vim.opt.iskeyword:append("-")
vim.env.CC = "gcc"
vim.opt.completeopt:append('popup')
vim.g.mapleader = " "
vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

-- custom editor looks
vim.cmd("colorscheme leonardo")
require("statusline")
require("godot-config")

-- plugin stuff
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src= "https://github.com/xiyaowong/transparent.nvim" },
})

vim.treesitter.language.add("json")
vim.treesitter.language.add("gdscript")

vim.lsp.enable({ "lua_ls", "gdscript" })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
    end
  end,
})

-- transparent background
local transparency = require("transparent")
transparency.toggle(true)

-- generic keybindings
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>s", ":update<CR> :restart<CR>")
vim.keymap.set("n", "<leader><Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- file explorer
vim.keymap.set("n", "<leader>e", ":Rex<CR>")
vim.keymap.set("n", "<leader>E", ":cd $HOME<CR> :Explore $HOME<CR>")
vim.keymap.set("n", "<leader>ff", ":find ")


-- buffer management
vim.keymap.set("n", "<leader>bp", ":bp<CR>")
vim.keymap.set("n", "<leader>bd", ":bw<CR>")
vim.keymap.set("n", "<leader>bb", ":ls<CR>")
vim.keymap.set("n", "<leader>bb", function()
  vim.cmd("ls")
  local buf = tonumber(vim.fn.input("Buffer number: "))
  if buf then
    vim.cmd("buffer " .. buf)
  end
end, { desc = "List buffers and jump to one" })

-- clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

