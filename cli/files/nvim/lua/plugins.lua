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
    "loganswartz/selenized.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.opt.synmaxcol = 300

      vim.cmd.syntax("on")
      vim.cmd.filetype("plugin indent on")
      vim.cmd.colorscheme("selenized")
    end
  },
  -- git commands
  "tpope/vim-fugitive",
  -- Dependency for cleaner command repeating
  "tpope/vim-repeat",
  -- Automtically adjust some stuff like tabstops and the like
  "tpope/vim-sleuth",
  -- save as sudo
  {
    "lambdalisue/vim-suda",
    config = function()
      vim.g.suda_smart_edit = 1

      vim.keymap.set("c", "w!!", ":SudaWrite<CR>")
    end
  },
  -- Automatically highlight what is under the cursor
  "RRethy/vim-illuminate",
  -- better quickfix window
  "kevinhwang91/nvim-bqf",
  -- fzf support
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  --highlights ranges you punch in to the comand path
  {
    "winston0410/range-highlight.nvim",
    dependencies = {
      "winston0410/cmd-parser.nvim",
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  -- git gutter signs
  "lewis6991/gitsigns.nvim",
  -- hex color highlighter plugin
  "norcalli/nvim-colorizer.lua",
  -- LSP Status indicator
  "j-hui/fidget.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "astro", "cmake", "css", "csv", "diff", "dockerfile", "fish", "git_config", "git_rebase", "gitattributes", "gitignore", "gitcommit", "html", "java", "javascript", "json", "json5", "markdown", "markdown_inline", "meson", "ninja", "nix", "python", "ron", "rust", "scss", "slint", "toml", "typescript", "tsx", "xml", "yaml", "zig" },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
    }
  },
  {
    'LhKipp/nvim-nu',
    build = ':TSInstall nu',
    opts = {}
  },
  {
    "ms-jpq/chadtree",
    branch = "chad",
    build = "python3 -m chadtree deps",
    dependencies = {
      "ryanoasis/vim-devicons",
    },
    config = function()
      vim.api.nvim_create_autocmd("StdinReadPre", {
        callback = function()
          vim.g.std_in = 1
        end
      })

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv()[1]) == 1 and not vim.g.std_in then
            vim.cmd("CHADopen")
            vim.cmd("cd " .. vim.fn.argv()[1])
          end
        end
      })
    end
  },
  {
    "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
    lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
    dependencies = {
      -- main one
      { "ms-jpq/coq_nvim", branch = "coq" },

      -- 9000+ Snippets
      { "ms-jpq/coq.artifacts", branch = "artifacts" },

      -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
      -- Need to **configure separately**
      { 'ms-jpq/coq.thirdparty', branch = "3p" }
      -- - shell repl
      -- - nvim lua api
      -- - scientific calculator
      -- - comment banner
      -- - etc
    },
    init = function()
      vim.g.coq_settings = {
          auto_start = true, -- if you want to start COQ at startup
          -- Your COQ settings here
      }
    end,
    config = function()
        -- Your LSP settings here
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          vim.wo.signcolumn = 'yes:3'
        end,
      })

      require'lspconfig'.lua_ls.setup {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
              -- library = vim.api.nvim_get_runtime_file("", true)
            }
          })
        end,
        settings = {
          Lua = {}
        }
      }
      require'lspconfig'.nixd.setup {}
    end,
  },
  {
    "mhartington/formatter.nvim",
    opts = function()

    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "lua", "markdown", "nix" },
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
  },
})
