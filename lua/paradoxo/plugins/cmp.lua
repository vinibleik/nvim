return {
    "hrsh7th/nvim-cmp",
    dependencies = {
    {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
            require("luasnip").config.set_config(opts)
            require("paradoxo.configs.luasnip_cfg")
        end,
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    },

    config = function()
      require("paradoxo.configs.cmp_cfg")
    end,
  }
