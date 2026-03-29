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
  {
    'nvim-mini/mini.surround',
    version = false,
    opts = {
      mappings = {
        add = '<Leader>s',
        delete = '<Leader>sd',
        replace = '<Leader>sr',
        find = '',
        find_left = '',
        highlight = '',
        update_n_lines = '',
      },
    },
  },
  { 'nvim-mini/mini.move', version = false, opts = {}, },
  { 'nvim-mini/mini.notify', version = false, opts = {}, },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      local npairs = require('nvim-autopairs')
      local Rule = require('nvim-autopairs.rule')
      local cond = require('nvim-autopairs.conds')
      local ts_conds = require('nvim-autopairs.ts-conds')

      npairs.setup({
        check_ts = true,
        enable_check_bracket_line = false,
        ignored_next_char = '[%w%.]',
        map_cr = false,
        map_bs = false,
      })

      -- Don't add pairs if there's already a close pair on the line
      npairs.get_rules('(')[1]:with_pair(cond.not_after_regex('%)')):with_pair(ts_conds.is_not_ts_node({ 'string' }))
      npairs.get_rules('[')[1]:with_pair(cond.not_after_regex('%]')):with_pair(ts_conds.is_not_ts_node({ 'string' }))
      npairs.get_rules('{')[1]:with_pair(cond.not_after_regex('%}')):with_pair(ts_conds.is_not_ts_node({ 'string' }))

      local k = function(s) return vim.api.nvim_replace_termcodes(s, true, false, true) end

      -- Unified keymaps: coq completion + autopairs
      -- coq_settings.keymap.recommended = false, so we own these mappings

      vim.keymap.set('i', '<CR>', function()
        if vim.fn.pumvisible() == 1 then
          if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
            return k('<C-y>')
          end
          return k('<C-e>') .. npairs.autopairs_cr()
        end
        return npairs.autopairs_cr()
      end, { expr = true, replace_keycodes = false, silent = true })

      vim.keymap.set('i', '<BS>', function()
        if vim.fn.pumvisible() == 1 then
          return k('<C-e>') .. npairs.autopairs_bs()
        end
        return npairs.autopairs_bs()
      end, { expr = true, replace_keycodes = false, silent = true })

      vim.keymap.set('i', '<Tab>', function()
        return vim.fn.pumvisible() == 1 and k('<C-n>') or k('<Tab>')
      end, { expr = true, replace_keycodes = false, silent = true })

      vim.keymap.set('i', '<S-Tab>', function()
        return vim.fn.pumvisible() == 1 and k('<C-p>') or k('<S-Tab>')
      end, { expr = true, replace_keycodes = false, silent = true })

      vim.keymap.set('i', '<Esc>', function()
        return vim.fn.pumvisible() == 1 and k('<C-e><Esc>') or k('<Esc>')
      end, { expr = true, replace_keycodes = false, silent = true })

      vim.keymap.set('i', '<C-c>', function()
        return vim.fn.pumvisible() == 1 and k('<C-e><C-c>') or k('<C-c>')
      end, { expr = true, replace_keycodes = false, silent = true })
    end,
  },
  { 'nvim-mini/mini.pick', version = false, opts = {}, },
  { 'nvim-mini/mini.sessions', version = false, opts = {}, lazy = false, },
  { 'nvim-mini/mini.splitjoin', version = false, opts = {}, },
  { 'nvim-mini/mini.starter', version = false, opts = {}, lazy = false, },
  { 'nvim-mini/mini.statusline', version = false, opts = {}, lazy = false, },
  { 'nvim-mini/mini.tabline', version = false, opts = {}, lazy = false, },
}
