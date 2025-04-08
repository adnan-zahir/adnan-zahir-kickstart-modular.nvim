return {
  'numToStr/Navigator.nvim',
  config = function()
    local navigator = require 'Navigator'

    navigator.setup {
      disable_on_zoom = true, -- defaults to false
    }

    vim.keymap.set({ 'n', 't' }, '<C-h>', '<CMD>NavigatorLeft<CR>')
    vim.keymap.set({ 'n', 't' }, '<C-l>', '<CMD>NavigatorRight<CR>')
    vim.keymap.set({ 'n', 't' }, '<C-k>', '<CMD>NavigatorUp<CR>')
    vim.keymap.set({ 'n', 't' }, '<C-j>', '<CMD>NavigatorDown<CR>')
    vim.keymap.set({ 'n', 't' }, '<C-p>', '<CMD>NavigatorPrevious<CR>')
  end,
}
