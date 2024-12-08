local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "arcticicestudio/nord-vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.opt.synmaxcol = 300

      vim.cmd.syntax("on")
      vim.cmd.filetype("plugin indent on")
      vim.cmd.colorscheme("nord")
    end
  },
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "tpope/vim-sleuth",
  {
    "lambdalisue/vim-suda",
    config = function()
      vim.g.suda_smart_edit = 1

      vim.keymap.set("c", "w!!", ":SudaWrite<CR>")
    end
  },
  "RRethy/vim-illuminate",
  {
    "kevinhwang91/nvim-bqf",
    config = function()
      require('bqf').setup{}
    end
  },
  "winston0410/cmd-parser.nvim",
  {
    "winston0410/range-highlight.nvim",
    config = function()
      require'range-highlight'.setup{}
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup{}
    end
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup{
        text = {
          spinner = "pipe",
        },
      }
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "astro", "cmake", "css", "csv", "diff", "dockerfile", "fish", "git_config", "git_rebase", "gitattributes", "gitignore", "gitcommit", "html", "java", "javascript", "json", "json5", "markdown", "markdown_inline", "meson", "ninja", "nix", "python", "ron", "rust", "scss", "slint", "toml", "typescript", "tsx", "xml", "yaml", "zig" },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      }
    end
  },
  {
    'LhKipp/nvim-nu',
    build = ':TSInstall nu',
    opts = {}
  },
})
