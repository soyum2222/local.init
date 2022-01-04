set clipboard=unnamed
set relativenumber
set number
set incsearch
set mouse=a

noremap <F2> :NERDTreeTabsToggle<CR> 
noremap <F7> :lua require'dap'.step_into()<CR>
noremap <F8> :lua require'dap'.step_over()<CR>
noremap <F9> :lua require'dap'.continue()<CR>


noremap <A-n> :tabnew<CR>
noremap <A--> :tabp<CR>
noremap <A-=> :tabn<CR>
noremap <leader>b :lua require'dap'.toggle_breakpoint()<CR>
noremap <leader>c :lua require'dap'.continue()<CR>
noremap <leader>s :lua require('dap.ui.widgets').hover()<CR>
noremap <leader>w :lua local widgets =  require('dap.ui.widgets'); widgets.centered_float(widgets.scopes)<CR>
noremap <leader>g :G<CR>
noremap <leader><F6> :lua vim.lsp.buf.rename()<CR>
map <A-/> <plug>NERDCommenterToggle
nnoremap <C-f> <cmd>Telescope live_grep<cr>


" compatible windows terminal
noremap n :tabnew<CR>
noremap - :tabp<CR>
noremap = :tabn<CR>

command DebugW lua local widgets = require('dap.ui.widgets');local my_sidebar = widgets.sidebar(widgets.scopes);my_sidebar.open();local widgets = require('dap.ui.widgets');local my_sidebar = widgets.sidebar(widgets.frames);my_sidebar.open();

autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd VimEnter * NERDTree

function GoDebug()
	copen
	lua GoDebugStar()
	AsyncRun dlv dap -l 127.0.0.1:38697 --log --log-output="dap" "$(VIM_FILEPATH)" 
endfunction

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

" hint
" Plug 'dense-analysis/ale'

" auto hint
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'jiangmiao/auto-pairs'

" auto save
Plug 'Pocco81/AutoSave.nvim'

" clorscheme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sainnhe/sonokai'

" git plug
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'


" async run
Plug 'skywind3000/asyncrun.vim'

" function signature hint
Plug 'ray-x/lsp_signature.nvim'

" dap
Plug 'mfussenegger/nvim-dap'
Plug 'soyum2222/nvim-dap-go'
Plug 'mfussenegger/nvim-dap-python'

" go plug
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'edolphin-ydf/goimpl.nvim'

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" commenter
Plug 'preservim/nerdcommenter'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' 

" scrollbar
Plug 'dstein64/nvim-scrollview'

" telescope
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" scheme
" colorscheme dracula
" Important!!
if has('termguicolors')
	set termguicolors
endif
" the configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:airline_theme = 'sonokai'
colorscheme sonokai

" By default, it will be triggered by `ENTER` in insert mode.
" set this to 1 to use `CTRL+ENTER` instead, and keep the  
" default `ENTER` behavior unchanged.
let g:rtf_ctrl_enter = 0

" Enable formatting when leaving insert mode
" let g:rtf_on_insert_leave = 1
"
" DBUI setting
let g:db_ui_table_helpers = {'mysql': {'Count': 'select count(*) from {table}'}}
let g:db_ui_auto_execute_table_helpers = 1

" disable vim-go auto function
let g:go_fmt_autosave = 0
let g:go_mod_fmt_autosave = 0
let g:go_asmfmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_metalinter_autosave = 0
let g:go_asmfmt_autosave = 0
let g:go_auto_sameids = 0
let g:go_auto_type_info = 0
let g:go_template_autocreate = 0

let g:NERDTreeGitStatusIndicatorMapCustom = {
			\ 'Modified'  :'💚',
			\ 'Staged'    :'✚',
			\ 'Untracked' :'🖤',
			\ 'Renamed'   :'➜',
			\ 'Unmerged'  :'═',
			\ 'Deleted'   :'✖',
			\ 'Dirty'     :'✗',
			\ 'Ignored'   :'☒',
			\ 'Clean'     :'✔︎',
			\ 'Unknown'   :'?',
			\ }

" compatible windows terminal
if &term =~ "xterm"
	let &t_SI = "\<Esc>[6 q"
	let &t_SR = "\<Esc>[3 q"
	let &t_EI = "\<Esc>[2 q"
endif


" compatible windows terminal
if exists('$TMUX')
	let &t_SI .= "\e[6 q"
	let &t_SR .= "\e[3 q"
	let &t_EI .= "\e[2 q"
endif

" nvim on windows enter CTRL+Z 
let s:is_win = has('win32') || has('win64')
if s:is_win
	"... other Windows specific settings

	nmap <C-z> <Nop>
endif

" vim-go testFunc log print
let g:go_term_enabled=1
let g:go_term_mode = "10split"

" disable auto pairs map
let g:AutoPairsShortcutJump=''
let g:AutoPairsShortcutFastWrap=''
let g:AutoPairsShortcutBackInsert=''

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

hi Visual  guifg=#000000 guibg=#FFFFFF gui=none
hi LspReferenceText guifg=#000000 guibg=#FFFF00 gui=none 
hi LspReferenceRead guifg=#000000 guibg=#FFFF00 gui=none 
hi LspReferenceWrite guifg=#000000 guibg=#FFFF00 gui=none 


set completeopt=menu,menuone,noselect

" customize command
command! GitDiff Gitsigns diffthis


set updatetime=10

augroup ScrollbarInit
	  autocmd!
	  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
	  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
	  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end

lua << EOF

function TableString(tab, max_indent, append_str)
	max_indent = max_indent or 3
	append_str = append_str or ""
	local res = append_str or ""

	local loopTableDict = {}

	local _tableString
	function _tableString(t, indent)
		if t == nil then
			return "~nil"
		elseif type(t) == "table" then
			if loopTableDict[t] then
				return "{loopTable}"
			elseif indent < max_indent then
				loopTableDict[t] = true

				local strs = {"{"}

				for k,v in pairs(t) do
					local key = k
					if tonumber(key) ~= nil then
						key = "[" .. key .. "]"
					end
					table.insert( strs, string.rep("    ",indent+1) .. key .. "=" .. _tableString(v, indent + 1))
				end

				table.insert(strs, string.rep("    ", indent) .. "}")

				return table.concat(strs, "\n")
			else
				return tostring(t)
			end
		elseif type(t) == "string" then
			return '"' .. t .. '"'
		else
			return tostring(t)
		end
	end

	return res .. _tableString(tab, 0)

end

function GoDebugStar()
	vim.ui.input({
		prompt="program arguments:",
		default="",
	},function(args)

		 

		for key,value in ipairs(dap.configurations.go)
		do
			dap.configurations.go[key].args = vim.split(args," ")
		end

		end)
end


	require'nvim-treesitter.configs'.setup {
		highlight = {
		enable = true,
		},
	}

-- Gitsigns
require('gitsigns').setup {
	signs = {
		add = { hl = 'GitGutterAdd', text = '+' },
		change = { hl = 'GitGutterChange', text = '~' },
		delete = { hl = 'GitGutterDelete', text = '_' },
		topdelete = { hl = 'GitGutterDelete', text = '‾' },
		changedelete = { hl = 'GitGutterChange', text = '~' },
		},
	keymaps = {
		-- Default keymap options
		noremap = true,

		['n ]h'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
		['n [h'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

		['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		--['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
		--['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
		--['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
		--['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

		-- Text objects
		['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
		['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
		},
	watch_gitdir = {
		interval = 1000,
		follow_files = true
		},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 100,
		ignore_whitespace = false,
		},
	current_line_blame_formatter_opts = {
		relative_time = false
		},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
		},
	yadm = {
	enable = false
	},
linehl = true
}

-- dap = require('dap')
-- 
-- dap.adapters.go = function(callback, config)
--   local stdout = vim.loop.new_pipe(false)
--   local handle
--   local pid_or_err
--   local port = 38697
--   local opts = {
--     stdio = {nil, stdout},
--     args = {"dap", "-l", "127.0.0.1:" .. port},
--     detached = true
--   }
--   handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
--     stdout:close()
--     handle:close()
--     if code ~= 0 then
--       print('dlv exited with code', code)
--     end
--   end)
--   assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
--   stdout:read_start(function(err, chunk)
--     assert(not err, err)
--     if chunk then
--       vim.schedule(function()
--         require('dap.repl').append(chunk)
--       end)
--     end
--   end)
--   -- Wait for delve to start
--   vim.defer_fn(
--     function()
--       callback({type = "server", host = "127.0.0.1", port = port})
--     end,
--     100)
-- end
-- 
-- dap.configurations.go = {
-- 	{
-- 			type = "go",
-- 			name = "Debug",
-- 			request = "launch",
-- 			program = "${file}"
-- 	},
-- 	{
-- 			type = "go",
-- 			name = "Debug test", -- configuration for debugging test files
-- 			request = "launch",
-- 			mode = "test",
-- 			program = "${file}"
-- 	},
-- 	-- works with go.mod packages and sub packages 
-- 	{
-- 			type = "go",
-- 			name = "Debug test (go.mod)",
-- 			request = "launch",
-- 			mode = "test",
-- 			program = "./${relativeFileDirname}"
-- 	} 
-- }


require('dap-go').setup()
require('dap-python').setup('python')



-- autosave
local autosave = require("autosave")
autosave.setup(
{
enabled = true,
execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
events = {"InsertLeave", "TextChanged"},
conditions = {
	exists = true,
	filename_is_not = {},
	filetype_is_not = {},
	modifiable = true
	},
write_all_buffers = false,
on_off_commands = true,
clean_command_line_interval = 0,
debounce_delay = 135
}
)

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({


	preselect = 2,
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
		vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
	end,
	},

    	mapping = {
    	        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    	        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    	        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    	        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    	        ['<C-e>'] = cmp.mapping({
    	        i = cmp.mapping.abort(),
    	        c = cmp.mapping.close(),
    	        }),
    	-- Accept currently selected item. If none selected, `select` first item.
    	-- Set `select` to `false` to only confirm explicitly selected items.
    	['<CR>'] = cmp.mapping.confirm({ select = true }),
    	},
    	sources = cmp.config.sources({
    	{ name = 'nvim_lsp' },
    	-- { name = 'vsnip' }, -- For vsnip users. -- { name = 'luasnip' }, -- For luasnip users.
    	{ name = 'ultisnips' }, -- For ultisnips users.
    	-- { name = 'snippy' }, -- For snippy users.
    	}, {
    	{ name = 'buffer' },
    	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
        sources = {
      	  { name = 'buffer' }
      	  }
        })


-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--         sources = cmp.config.sources({
--         { name = 'path' }
--         }, {
--         { name = 'cmdline' }
--         })
-- })



  -- LSP settings
  local nvim_lsp = require 'lspconfig'
  local on_attach = function(_, bufnr)
  require "lsp_signature".on_attach() 

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }

  vim.api.nvim_command('autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()')
  vim.api.nvim_command('autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
  vim.api.nvim_command('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr,'n','<C-s>','<cmd>lua vim.lsp.buf.formatting()<CR>',opts)
  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua require(\'telescope.builtin\').lsp_definitions(require(\'telescope.themes\').get_ivy({}))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua require(\'telescope.builtin\').lsp_implementations(require(\'telescope.themes\').get_ivy({}))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua require(\'telescope.builtin\').lsp_references(require(\'telescope.themes\').get_ivy({}))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua require(\'telescope.builtin\').lsp_code_actions(require(\'telescope.themes\').get_ivy({}))<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ws', '<cmd>lua require(\'telescope.builtin\').lsp_workspace_symbols(require(\'telescope.themes\').get_ivy({}))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ws', '<cmd>lua require(\'telescope.builtin\').lsp_dynamic_workspace_symbols({symbols="interface"})<CR>', opts)
end


-- Setup lspconfig.
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig').pylsp.setup {
	cmd = {"pylsp"},
	on_attach = on_attach
	}


-- config that activates keymaps and enables snippet support
local function make_config()
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
return {
	-- enable snippet support
	capabilities = capabilities,
	-- map buffer local keybindings when the language server attaches
	on_attach = on_attach,
	}
end


-- #region lsp install
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
local config = make_config()

-- language specific config

if server.name == "gopls" then
	local util = require('lspconfig/util')
	local lastRootPath = nil
	local gopath = os.getenv("GOPATH")
	local singleFile = false
	if gopath == nil then
		gopath = ""
	end

	local gopathmod = gopath..'/pkg/mod'

	local currentFilePath = vim.api.nvim_buf_get_name(0) 

	if not string.find(currentFilePath,gopath) then
		-- current file not in gopath , is a single file 
		singleFile = true
		config.single_file_support = true
	end


	config.root_dir = function(fname)

	local fullpath = vim.fn.expand(fname, ':p')

	if string.find(fullpath, gopathmod) and lastRootPath ~= nil then
		print(lastRootPath)
		return lastRootPath
	end

	lastRootPath = util.root_pattern("go.mod", ".git")(fname)

	return lastRootPath
end

-- golang 
local opts = { noremap = true, silent = true }
vim.api.nvim_command('command DebugRun call GoDebug()')
vim.api.nvim_set_keymap('n','<leader><CR>', ':GoFillStruct<CR>',opts)
vim.api.nvim_set_keymap('n','<leader>`', ':GoAddTags json yaml<CR>',opts)
vim.api.nvim_set_keymap('n', '<leader>im', [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>c', ':lua require"dap-go".start_debug(require"dap")<CR>', {noremap=true, silent=true})

end


if server.name == "pylsp" then
	config.settings = {
		-- experimentalPostfixCompletions = true,
		experimentalWorkspaceModule = false,
		semanticTokens = true,
		}
end


-- (optional) Customize the options passed to the server
-- if server.name == "tsserver" then
--     opts.root_dir = function() ... end
-- end

-- This setup() function is exactly the same as lspconfig's setup function.
-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md


server:setup(config)
end)

EOF
