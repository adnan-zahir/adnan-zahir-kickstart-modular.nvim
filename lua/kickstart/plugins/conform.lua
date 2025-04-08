local prettier = { 'prettierd', 'prettier', stop_after_first = true }

return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'LspAttach', 'BufReadPost', 'BufNewFile' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback', lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    init = function()
      vim.o.formatexpr = [[v:lua.require("conform").formatexpr()]]
    end,
    opts = function()
      local opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
          -- Disable "format_on_save lsp_fallback" for languages that don't
          -- have a well standardized coding style. You can add additional
          -- languages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          local lsp_format_opt
          if disable_filetypes[vim.bo[bufnr].filetype] then
            lsp_format_opt = 'never'
          else
            lsp_format_opt = 'fallback'
          end
          return {
            timeout_ms = 2500,
            lsp_format = lsp_format_opt,
          }
        end,
        formatters = {
          injected = { options = { ignore_errors = true } },
        },
        formatters_by_ft = {
          lua = { 'stylua' },
          -- Conform can also run multiple formatters sequentially
          -- python = { "isort", "black" },
          --
          -- You can use 'stop_after_first' to run the first available formatter from the list
          php = { 'pint', 'php_cs_fixer', stop_after_first = true },
          blade = prettier,
          css = prettier,
          graphql = prettier,
          handlebars = prettier,
          html = prettier,
          javascript = prettier,
          javascriptreact = prettier,
          typescript = prettier,
          typescriptreact = prettier,
          json = prettier,
          jsonc = prettier,
          jsx = prettier,
          markdown = prettier,
          react = prettier,
          scss = prettier,
          yaml = prettier,
        },
      }
      return opts
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
