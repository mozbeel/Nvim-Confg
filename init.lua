require("plugins")
require("lsp")
require("lspconfig").clangd.setup({})
require("lspconfig").cmake.setup({})

vim.opt.tabstop = 2      -- Number of visual spaces per tab
vim.opt.shiftwidth = 2   -- Number of spaces for each indent
vim.opt.expandtab = true -- Convert tabs to spaces

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        -- leave everything else as default
      })
    end
  }
end)


-- Normal mode
vim.keymap.set("n", "<C-Up>", ":m .-2<CR>==")
vim.keymap.set("n", "<C-Down>", ":m .+1<CR>==")

vim.keymap.set("n", "<C-Right>", ">>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "<<", { noremap = true, silent = true })

vim.keymap.set('n', '<A-Left>',  'b', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Right>', 'w', { noremap = true, silent = true })
vim.keymap.set('v', '<A-Left>',  'b', { noremap = true, silent = true })
vim.keymap.set('v', '<A-Right>', 'w', { noremap = true, silent = true })

vim.keymap.set('n', '<C-#>', function()
  require('Comment.api').call('toggle.linewise.current', 'uncomment')
end, { noremap = true, silent = true })

-- Visual mode
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "<C-Right>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-Left>", "<gv", { noremap = true, silent = true })

vim.keymap.set('n', '<A-Up>',    '5k', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Down>',  '5j', { noremap = true, silent = true })
vim.keymap.set('v', '<A-Up>',    '5k', { noremap = true, silent = true })
vim.keymap.set('v', '<A-Down>',  '5j', { noremap = true, silent = true })

vim.keymap.set('v', '<C-#>', function()
  require('Comment.api').call('toggle.linewise.current', 'uncomment')
end, { noremap = true, silent = true })

-- Insert mode

vim.keymap.set('i', '<A-Left>',  '<Esc>bi', { noremap = true, silent = true })
vim.keymap.set('i', '<A-Right>', '<Esc>ea', { noremap = true, silent = true })

