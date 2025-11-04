return {
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
}
