-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands

-- Navigate between pane splits
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { silent = true, noremap = true })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { silent = true, noremap = true })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { silent = true, noremap = true })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { silent = true, noremap = true })

-- Quick escape form insert to normal mode
vim.keymap.set('i', 'jk', '<Esc>', { silent = true })

-- Quick buffer delete
-- vim.keymap.set('n', '<leader>bd', ':bn <Return>', { desc = '[B]uffer [D]elete' })

-- Split pane
vim.keymap.set('n', '<leader>|', ':vsplit <Return>', { desc = 'Split |' })
vim.keymap.set('n', '<leader>-', ':split <Return>', { desc = 'Split -' })

-- Buffer navigation
-- vim.keymap.set('n', 'H', ':bprevious <Return>', { silent = true })
-- vim.keymap.set('n', 'L', ':bnext <Return>', { silent = true })

-- Tab navigation
vim.keymap.set('n', '<C-H>', ':tabprevious <Return>', { silent = true })
vim.keymap.set('n', '<C-L>', ':tabnext <Return>', { silent = true })

-- --------
-- BarBar
-- -------- Sort automatically by...
vim.keymap.set('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', { noremap = true, silent = true, desc = '[B]uffer Sort Number' })
vim.keymap.set('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>', { noremap = true, silent = true, desc = '[B]uffer Sort [N]ame' })
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferOrderByDirectory<CR>', { noremap = true, silent = true, desc = '[B]uffer Sort [P]ath' })
vim.keymap.set('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', { noremap = true, silent = true, desc = '[B]uffer Sort [L]anguage' })
vim.keymap.set('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', { noremap = true, silent = true, desc = '[B]uffer Sort [W]indow Number' })
vim.keymap.set('n', '<leader>bd', '<Cmd>BufferClose<CR>', { noremap = true, silent = true, desc = '[B]uffer [D]elete' })
-- Move to previous/next
vim.keymap.set('n', 'H', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'L', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
-- Re-order to previous/next
vim.keymap.set('n', '<A-h>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
