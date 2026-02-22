-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Adds for example ]q and [q for quickfix movement
  'tpope/vim-unimpaired',
  'tpope/vim-repeat',
  'tpope/vim-sleuth',

  -- Tmux, also creates binds to jump between windows and resize them
  {
    'aserowy/tmux.nvim',
    opts = {
      navigation = {
        cycle_navigation = false,
        enable_default_keybindings = true,
      },
    },
  },

  -- Swap windows with <leader>ww
  { 'wesQ3/vim-windowswap' },

  -- Jump to previous or next buffer
  {
    'kwkarlwang/bufjump.nvim',
    opts = {
      forward_key = '<C-n>',
      backward_key = '<C-p>',
      on_success = nil,
    },
  },

  -- Theme
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function() vim.cmd.colorscheme 'dayfox' end,
  },

  -- Treesitter based split join
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup { --[[ your config ]]
      }
    end,
  },

  -- Displays line on top showing context
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      -- separator = "-",
      multiline_threshold = 1,
      mode = 'topline',
    },
  },

  -- Rainbow brackets
  'HiPhish/rainbow-delimiters.nvim',

  -- Small plugins
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      animate = { enabled = true },
      bigfile = { enabled = true },
      indent = { enabled = true },
      -- notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      scope = { enabled = true },
      statuscolumn = { enabled = true },
    },
  },

  { -- Render markdown, useful for AI output
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'codecompanion' },
  },

  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'ravitemer/mcphub.nvim',
    },
    opts = {
      adapters = {
        http = {
          ollama = function()
            return require('codecompanion.adapters').extend('ollama', {
              env = {
                url = 'http://192.168.2.6:11434',
              },
            })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = {
            name = 'ollama',
            model = 'qwen3-coder:30b',
          },
        },
      },
    },
  },

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
}
