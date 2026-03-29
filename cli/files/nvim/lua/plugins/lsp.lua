return {
  {
    "ejrichards/mise.nvim",
    opts = {}
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "astro", "cmake", "css", "csv", "diff", "dockerfile", "fish", "git_config", "git_rebase", "gitattributes", "gitignore", "gitcommit", "html", "java", "javascript", "json", "json5", "markdown", "markdown_inline", "meson", "ninja", "nix", "python", "ron", "rust", "scss", "slint", "toml", "typescript", "tsx", "xml", "yaml", "zig" },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
        },
    }
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
          auto_start = 'shut-up',
          keymap = { recommended = false },
      }
    end,
    config = function()
        -- Your LSP settings here
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          vim.wo.signcolumn = 'yes:3'
        end,
      })

      -- Then add an autocmd to auto-restart on crash:
      vim.api.nvim_create_autocmd("LspDetach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "nixd" then
            -- Small delay to avoid rapid restart loops
            vim.defer_fn(function()
              local buf = args.buf
              if vim.api.nvim_buf_is_valid(buf) then
                vim.cmd("LspStart nixd")
              end
            end, 1000)
          end
        end,
      })

      vim.lsp.config('lua_ls', {
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
      })
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("nixd")
    end,
  },
}
