vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	  use 'neovim/nvim-lspconfig'
	  use 'hrsh7th/nvim-cmp'
	  use 'hrsh7th/cmp-nvim-lsp'
	  use 'hrsh7th/cmp-buffer'
	  use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
          --–– you can tweak these, but defaults are sane for most
          padding    = true,     -- add a space b/w comment and line
          sticky     = true,     -- cursor stays put
          ignore     = nil,      -- e.g. '^$' to ignore empty lines
          toggler = {
            line   = '<C-,>',    -- ctrl+slash on many layouts
            block  = '<Leader>cb',
          },
          opleader = {
            line   = '<C-,>',
            block  = '<Leader>cB',
          },
        })
      end
  }
end)

