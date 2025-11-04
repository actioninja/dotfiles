return {
  {
    'nvim-mini/mini.ai',
    version = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    'nvim-mini/mini.align',
    version = false,
    keys = {
      {"ga",},
      {"gA"},
    },
    opts = {}
  },
  { 'nvim-mini/mini.bracketed', version = false, opts = {}, },
  { 'nvim-mini/mini.bufremove', version = false, opts = {}, },
  {
    'nvim-mini/mini.clue',
    version = false,
    opts = {
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
      },
    },
  },
  { 'nvim-mini/mini.comment', version = false, opts = {}, },
  { 'nvim-mini/mini.cursorword', version = false, opts = {}, },
  { 'nvim-mini/mini.extra', version = false, opts = {}, },
  { 'nvim-mini/mini.fuzzy', version = false, opts = {}, },
  { 'nvim-mini/mini-git', version = false, config = function() require('mini.git').setup() end, },
  {
    'nvim-mini/mini.hipatterns',
    version = false,
    lazy = true,
    event = "VeryLazy",
    config = function()
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
        todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
        note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
    end,
  },
  { 'nvim-mini/mini.icons', version = false, opts = {}, },
  { 'nvim-mini/mini.indentscope', version = false, opts = {}, },
  { 'nvim-mini/mini.jump', version = false, opts = {}, },
  { 'nvim-mini/mini.keymap', version = false, opts = {}, },
  { 'nvim-mini/mini.misc', version = false, opts = {}, },
  { 'nvim-mini/mini.move', version = false, opts = {}, },
  { 'nvim-mini/mini.notify', version = false, opts = {}, },
  { 'nvim-mini/mini.pairs', version = false, opts = {}, },
  { 'nvim-mini/mini.pairs', version = false, opts = {}, },
  { 'nvim-mini/mini.pick', version = false, opts = {}, },
  { 'nvim-mini/mini.sessions', version = false, opts = {}, lazy = false, },
  { 'nvim-mini/mini.splitjoin', version = false, opts = {}, },
  { 'nvim-mini/mini.starter', version = false, opts = {}, lazy = false, },
  { 'nvim-mini/mini.statusline', version = false, opts = {}, lazy = false, },
  { 'nvim-mini/mini.tabline', version = false, opts = {}, lazy = false, },
}
