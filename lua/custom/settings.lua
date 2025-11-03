-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

-- When editing a file, always jump to the last known cursor position.
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local valid_line = vim.fn.line [['"]] >= 1 and vim.fn.line [['"]] < vim.fn.line '$'
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd [[normal! g`"]]
    end
  end,
})

-- Oldschool remaps
-- Adds motions like 25j and 30k to the jump list for ctrl+o/i. https://www.vi-improved.org/vim-tips/
vim.cmd "nnoremap <expr> j v:count ? (v:count > 1 ? \"m'\" . v:count : '') . 'j' : 'gj'"
vim.cmd "nnoremap <expr> k v:count ? (v:count > 1 ? \"m'\" . v:count : '') . 'k' : 'gk'"

-- Make :W :Q :X also work
vim.cmd 'cnorea W w'
vim.cmd 'cnorea Q q'
vim.cmd 'cnorea X w'

-- Unbind F1
vim.cmd 'nmap <F1> <nop>'
vim.cmd 'imap <F1> <nop>'
vim.cmd 'vmap <F1> <nop>'
vim.cmd 'xmap <F1> <nop>'
