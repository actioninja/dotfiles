return {
    {
        "ms-jpq/chadtree",
        branch = "chad",
        build = "python3 -m chadtree deps",
        dependencies = {
            "ryanoasis/vim-devicons",
        },
        lazy = true,
        event = "VeryLazy",
        config = function()
          vim.keymap.set("n", "<Leader><tab>", "<Cmd>CHADopen<CR>", { silent = true, desc = "Open Chadtree" })

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
}
