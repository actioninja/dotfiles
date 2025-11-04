return {
  {
    "folke/lazydev.nvim",
    lazy = true,
    ft = "lua",
    opts = {
      integrations = {
        lspconfig = true,
        cmp = false,
        coq = true,
      },
    },
  }
}
