local keymap = vim.keymap

-- copy clipboard
keymap.set({ 'n', 'x', 'o' }, 'gy', '"+y', { desc = 'Copy to clipboard' })
keymap.set({ 'n', 'x', 'o' }, 'gp', '"+p', { desc = 'Paste clipboard text' })
