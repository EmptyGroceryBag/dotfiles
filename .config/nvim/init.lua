require"pack"

-- Editor
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true


vim.cmd("colorscheme hybrid")
-- vim.cmd("colorscheme arctic")

-- Keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

vim.keymap.set('n', '<C-Right>', "gt", {})
vim.keymap.set('n', '<C-Left>', "gT", {})

vim.keymap.set('n', '<A-Up>', "<C-w><Up>", {})
vim.keymap.set('n', '<A-Down>', "<C-w><Down>", {})
vim.keymap.set('n', '<A-Right>', "<C-w><Right>", {})
vim.keymap.set('n', '<A-Left>', "<C-w><Left>", {})

-- Exit Telescope menu after first ESC keypress instead of second
local actions = require("telescope.actions")
require"telescope".setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
})

-- LSP
require"lspconfig".clangd.setup{}
require"lspconfig".pyright.setup{}
require"lspconfig".rust_analyzer.setup({})

local cmp = require('cmp')
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'nvim_lsp_signature_help'},
    {name = 'luasnip'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },

	-- Make Return the key to confirm insert
  mapping = cmp.mapping.preset.insert({
    ['<Cr>'] = cmp.mapping.confirm({select = true}),
	}),
})

-- Treesitter
require"nvim-treesitter.configs".setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "cpp", "rust", "python", "javascript", "typescript", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

		-- Disable highlighting if file is huge
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

