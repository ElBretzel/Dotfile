-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },


  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      -- [[ Configure Treesitter ]]
      -- See `:help nvim-treesitter`
      -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
      vim.defer_fn(function()
        require('nvim-treesitter.configs').setup {
          -- Add languages to be installed here that you want installed for treesitter
          ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc',
            'vim',
            'bash' },

          -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
          auto_install = false,

          highlight = { enable = true },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = '<c-space>',
              node_incremental = '<c-space>',
              scope_incremental = '<c-s>',
              node_decremental = '<M-space>',
            },
          },
          textobjects = {
            select = {
              enable = true,
              lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
              },
            },
            move = {
              enable = true,
              set_jumps = true, -- whether to set jumps in the jumplist
              goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
              },
              goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
              },
              goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
              },
              goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
              },
            },
            swap = {
              enable = true,
              swap_next = {
                ['<leader>a'] = '@parameter.inner',
              },
              swap_previous = {
                ['<leader>A'] = '@parameter.inner',
              },
            },
          },
        }
      end, 0)
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()

      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          javascript = { { "prettierd", "prettier" } },
          c = { "clang_format" },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_fallback = false,
        },
      })
    end
  },
  {
    'mfussenegger/nvim-lint',
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function ()
      local lint = require("lint");
      lint.linters_by_ft = {
        python = { "pylint" },
        cpp = { "clangtidy" }
      }

      local lint_autogroup = vim.api.nvim_create_augroup("lint", {clear = true})
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave"}, {
        group = lint_autogroup,
        callback = function ()
          lint.try_lint()
        end
      })
    end
  },
  {
   "folke/trouble.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
   },
   config = function ()
    vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle() end, { desc = "[T]rouble [T]oggle" })
    vim.keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "[T]rouble [W]orkspace" })
    vim.keymap.set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end, { desc = "[T]rouble [D]ocument" })
    vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end, { desc = "[T]rouble [Q]uickfix" })
    vim.keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end, { desc = "[T]rouble [L]ocation" })
   end
  }
}
