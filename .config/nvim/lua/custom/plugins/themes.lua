-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 0,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({
        style = "moon",
        light_style = "day",
        transparent = true,
        terminal_colors = true,
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "normal",
          floats = "normal",
        },
        sidebars = { "qf", "vista_kind", "terminal", "packer", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.5,                                            -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = true,                                 -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = true,                                             -- dims inactive windows
        lualine_bold = true,                                             -- When `true`, section headers in the lualine theme will be bold
      })
      vim.cmd.colorscheme 'tokyonight'
    end,
  }
}
