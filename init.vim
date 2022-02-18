set clipboard=unnamed
set relativenumber
set number
set incsearch
set mouse=a
set fileencodings=utf-8,gbk



noremap <F2> :NvimTreeToggle<CR> 
noremap <F7> :lua require'dap'.step_into()<CR>
noremap <F8> :lua require'dap'.step_over()<CR>
noremap <F9> :lua require'dap'.continue()<CR>


noremap <A-n> :tabnew<CR>
noremap <A--> :tabp<CR>
noremap <A-=> :tabn<CR>
noremap <leader>b :lua require'dap'.toggle_breakpoint()<CR>
noremap <leader>c :lua DapDebug()<CR>
noremap <leader>s :lua require('dap.ui.widgets').hover()<CR>
noremap <leader>w :lua local widgets =  require('dap.ui.widgets'); widgets.centered_float(widgets.scopes)<CR>
noremap <leader>g :G<CR>
noremap <leader>im :lua require'telescope'.extensions.goimpl.goimpl{}<CR>

nmap <leader><F6> <Plug>(coc-rename)
noremap <leader><Esc> :q!<cr>
noremap <C-s> :call CocActionAsync('format')<CR>
imap <C-s> <cmd>call CocActionAsync('format')<CR>

" go map
noremap <leader><CR> :GoFillStruct<CR>
noremap <leader>` :GoAddTags json yaml<CR>



map <A-/> <plug>NERDCommenterToggle
nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep({cwd=FilePath()})<cr>
nnoremap <leader><C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader><F1> <cmd>NvimTreeFindFile<cr>

" compatible windows terminal
noremap n :tabnew<CR>
noremap - :tabp<CR>
noremap = :tabn<CR>

command DebugW lua local widgets = require('dap.ui.widgets');local my_sidebar = widgets.sidebar(widgets.scopes);my_sidebar.open();local widgets = require('dap.ui.widgets');local my_sidebar = widgets.sidebar(widgets.frames);my_sidebar.open();

autocmd  VimEnter  * NvimTreeToggle 

call plug#begin()
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'itchyny/lightline.vim'


Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" async run
Plug 'skywind3000/asyncrun.vim'

" function signature hint
Plug 'ray-x/lsp_signature.nvim'

" dap
Plug 'Pocco81/DAPInstall.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'soyum2222/nvim-dap-go'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" go plug
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'edolphin-ydf/goimpl.nvim'

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" commenter
Plug 'preservim/nerdcommenter'

" indentation
Plug 'lukas-reineke/indent-blankline.nvim'


" For vsnip users.
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' 

" scrollbar
" Plug 'dstein64/nvim-scrollview'

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
let g:go_doc_keywordprg_enabled = 0
let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
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

" coc.nvim
let g:coc_config_home = '~/local.init/'
let g:coc_global_extensions = ['coc-json', 'coc-clangd','coc-pyright','coc-snippets','coc-go']

" disable auto pairs map
let g:AutoPairsShortcutJump=''
let g:AutoPairsShortcutFastWrap=''
let g:AutoPairsShortcutBackInsert=''
let g:AutoPairsShortcutToggle=''

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
hi CocHighlightText gui=bold guifg=#2b2d3a guibg=#6dcae8

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


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2


" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


lua << EOF

function FileFmt()
	local file_type = vim.bo.filetype
	if file_type == "go" then
		vim.api.nvim_exec([[GoImports]],true)
		vim.api.nvim_exec([[GoFmt]],true)
	else
		vim.api.nvim_exec([[call CocActionAsync('format')]],true)
	end
end

function DapDebug()
	local file_type = vim.bo.filetype
	if file_type == "go" then
		require"dap-go".start_debug(require"dap")
	else
		require"dap".continue()
	end
end

function FilePath()
	
	local sep = "/"
	if vim.loop.os_uname().sysname == "Windows_NT" then
		sep = "\\"
	end
	local currentFilePath = vim.api.nvim_buf_get_name(0)
	local s = vim.split(currentFilePath,sep)
	local dir = ""


	for k, v in pairs(s) do
		if k~=#s then
			dir = dir..v..sep
		end
	end

	return dir
end


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

require('dap-go').setup()
require('dap-python').setup('python')

local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/work/extension/debugAdapters/bin/OpenDebugAD7',
}

require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("nvim-dap-virtual-text").setup {
    enabled = true,                     -- enable this plugin (the default)
    enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,            -- show stop reason when stopped for exceptions
    commented = false,                  -- prefix virtual text with comment string
    -- experimental features:
    virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
                                        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}



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
debounce_delay = 5000
}
)


-- indentation


vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

-- init.lua

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
	open_on_tab=true,
	auto_close=true,
	open_on_setup=true,
	}

EOF
