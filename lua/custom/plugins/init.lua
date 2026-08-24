-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end

local gh = require('util').gh

do
  -- Adds for example ]q and [q for quickfix movement
  vim.pack.add { gh 'tpope/vim-unimpaired' }

  -- allows more actions to be dot-repeatable
  vim.pack.add { gh 'tpope/vim-repeat' }

  -- indent guessing
  -- vim.pack.add { gh 'tpope/vim-sleuth' }

  -- Tmux, also creates binds to jump between windows and resize them
  vim.pack.add { gh 'aserowy/tmux.nvim' }
  require('tmux').setup {
    navigation = {
      cycle_navigation = false,
      enable_default_keybindings = true,
    },
  }

  -- Swap windows with <leader>ww
  vim.pack.add { gh 'wesQ3/vim-windowswap' }

  -- Jump to previous or next buffer
  vim.pack.add { gh 'kwkarlwang/bufjump.nvim' }
  require('bufjump').setup {
    forward_key = '<C-n>',
    backward_key = '<C-p>',
    on_success = nil,
  }

  -- Treesitter based split join
  vim.pack.add { gh 'Wansmer/treesj' }
  require('treesj').setup {
    keys = { '<space>m', '<space>j', '<space>s' },
  }

  -- Displays line on top showing context
  vim.pack.add { gh 'nvim-treesitter/nvim-treesitter-context' }
  require('treesitter-context').setup {
    -- separator = "-",
    multiline_threshold = 1,
    mode = 'topline',
  }

  -- Rainbow brackets
  vim.pack.add { gh 'HiPhish/rainbow-delimiters.nvim' }
  require('rainbow-delimiters.setup').setup {}

  -- Small plugins
  vim.pack.add { gh 'folke/snacks.nvim' }
  require('snacks').setup {
    animate = { enabled = true },
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    indent = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    scroll = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
  }

  -- Render markdown, useful for AI output
  vim.pack.add { gh 'MeanderingProgrammer/render-markdown.nvim' }
  require('render-markdown').setup {
    ft = { 'markdown' },
  }
end

-- Python autoupdate imports on file name changes
-- Currently broken?
-- {
--   'alexpasmantier/pymple.nvim',
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--     'MunifTanjim/nui.nvim',
--     -- optional (nicer ui)
--     'stevearc/dressing.nvim',
--     'nvim-tree/nvim-web-devicons',
--   },
--   build = ':PympleBuild',
--   config = function()
--     require('pymple').setup()
--   end,
-- },
