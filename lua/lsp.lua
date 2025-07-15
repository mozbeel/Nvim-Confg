local lspconfig = require('lspconfig')
local cmp = require('cmp')


-- Completion setup
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- Expand snippets using LuaSnip
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),   -- Trigger completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),  -- Next item
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),  -- Previous item
  }),
  sources = {
    { name = 'nvim_lsp' },   -- LSP completion source
    { name = 'buffer' },     -- Buffer completion source
    { name = 'path' },       -- Path completion source
    { name = 'luasnip' },    -- Snippet completion source
  },
})


-- Set up clangd as the LSP server
lspconfig.clangd.setup({})

-- cmake
lspconfig.cmake.setup({
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
      workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
      telemetry = { enable = false },
    }
  }
})

lspconfig.nixd.setup({})

lspconfig.zls.setup({})

-- Enable error highlighting
vim.diagnostic.config({
  virtual_text = true,  -- Show error messages inline (near the code)
  signs = false,         -- Show diagnostic signs (like error/warning icons in the sign column)
  underline = true,     -- Underline error/warning text
  update_in_insert = true,  -- Update diagnostics while typing
  severity_sort = true,  -- Sort diagnostics by severity (error > warning > info)
})

-- Customize diagnostic highlight groups
vim.cmd [[
  hi DiagnosticError guifg=#ff0000 guibg=NONE guisp=NONE
  hi DiagnosticWarn guifg=#e0e000 guibg=NONE guisp=NONE
  hi DiagnosticInfo guifg=#00e0e0 guibg=NONE guisp=NONE
  hi DiagnosticHint guifg=#8080ff guibg=NONE guisp=NONE
  hi Comment guifg=#545454 guibg=NONE guisp=NONE
  hi Keyword guifg=#c151c9 guibg=NONE guisp=NONE
  hi @variable guifg=#ae82ff guibg=NONE guisp=NONE
  hi Identifier guifg=#ff69dc guibg=NONE guisp=NONE
  hi Function guifg=#edaafa guibg=NONE guisp=NONE
  hi Expression guifg=#95ff5c guibg=NONE guisp=NONE
  hi Statement guifg=#9a86b5 guibg=NONE guisp=NONE
  hi Type guifg=#bb09d6 guibg=NONE guisp=NONE
  hi Operator guifg=#d6ffad guibg=NONE guisp=NONE
  hi PreProc guifg=#ff75a1 guibg=NONE guisp=NONE
  hi Constant	guifg=#f194ff guibg=NONE guisp=NONE
  hi Operator guifg=#4bf2c3 guibg=NONE guisp=NONE
  hi RoundParen guifg=#3be3a5 guibg=NONE guisp=NONE
]]

-- Show diagnostics in a floating window when you hover over a line
vim.keymap.set('n', 'gh', vim.diagnostic.open_float, { desc = 'Show diagnostic in floating window' })
