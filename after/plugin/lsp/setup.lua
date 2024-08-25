local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local util = require('lspconfig.util')
local cmp_lsp = require('cmp_nvim_lsp')

local function create_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  vim.list_extend(
    capabilities.textDocument.completion.completionItem.resolveSupport.properties,
    {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  )
  return cmp_lsp.default_capabilities(capabilities)
end

util.on_setup = util.add_hook_after(util.on_setup, function(config)
  config.capabilities = vim.tbl_deep_extend(
    'force',
    create_capabilities(),
    config.capabilities or {}
  )
end)

require('mason-lspconfig').setup({
  -- configure, which server should be ensured to be installed
  ensure_installed = {},
})

require('mason-lspconfig').setup_handlers({
  -- configure your lsp servers here
})
