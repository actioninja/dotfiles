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
    config = function()
      require("indent_blankline").setup{char_highlight_list={'IndentBlankLine'}}
    end
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
        ensure_installed = "all",

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      }
    end
  },
})
