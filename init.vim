set clipboard=unnamed
"set relativenumber
set number
set incsearch
set mouse=a
set fileencodings=utf-8,gbk
set ff=unix

set completeopt-=preview
set completeopt-=menu


noremap <F2> :NvimTreeToggle<CR>
noremap <F7> :lua require'dap'.step_into()<CR>
noremap <F8> :lua require'dap'.step_over()<CR>
noremap <F9> :lua require'dap'.continue()<CR>



"noremap <A-n> :lua tabnew()<CR>
noremap <leader>- :lua tabprev()<CR>
noremap <leader>= :lua tabnext()<CR>
noremap <A--> :lua bufprev()<CR>
noremap <A-=> :lua bufnext()<CR>
noremap ≠ :lua bufnext()<CR>
noremap – :lua bufprev()<CR>


noremap <leader><tab> :lua bufswitch()<CR>


noremap <leader>b :lua require'dap'.toggle_breakpoint()<CR>
noremap <leader>c :lua DapDebug()<CR>
noremap <leader>d :lua require("dapui").toggle()<CR>
noremap <leader>s :lua require("dapui").eval()<CR>
noremap <leader>w :lua local widgets =  require('dap.ui.widgets'); widgets.centered_float(widgets.scopes)<CR>
noremap <leader>g :G<CR>
noremap <leader>im :lua require'telescope'.extensions.goimpl.goimpl{}<CR>
nnoremap <C-d> 15j
vnoremap <C-d> 15j
nnoremap <C-u> 15k
vnoremap <C-u> 15k


nmap <leader><F6> <Plug>(coc-rename)
noremap <leader>q :q!<cr>
noremap <C-s> :lua FileFmt()<CR>
imap <C-s> <cmd>lua FileFmt()<CR>

noremap <C-r> :%s/
vmap <C-r> :s/


" go map
noremap <leader><CR> :GoFillStruct<CR>
noremap <leader>` :GoAddTags json yaml<CR>



map <A-/> <plug>NERDCommenterToggle
map ÷ <plug>NERDCommenterToggle
nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep({cwd=FilePath()})<cr>
nnoremap <leader><C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader><F1> <cmd>NvimTreeFindFile<cr>
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>

" compatible windows terminal
noremap  :tabnew<CR>
noremap tabp<CR>
noremap  :tabn<CR>

command DebugW lua local widgets = require('dap.ui.widgets');local my_sidebar = widgets.sidebar(widgets.scopes);my_sidebar.open();local widgets = require('dap.ui.widgets');local my_sidebar = widgets.sidebar(widgets.frames);my_sidebar.open();

autocmd  VimEnter  * NvimTreeToggle
"autocmd TextChanged,FocusLost,BufEnter * silent update



call plug#begin()
Plug 'Exafunction/codeium.vim'

Plug 'tpope/vim-pathogen'
Plug 'folke/persistence.nvim'

Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
" Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'romgrk/barbar.nvim'

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jiangmiao/auto-pairs'

" auto save
Plug 'pocco81/auto-save.nvim'

" clorscheme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'folke/tokyonight.nvim'


" git plug
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
" Plug 'NeogitOrg/neogit'
Plug 'sindrets/diffview.nvim'
Plug 'FabijanZulj/blame.nvim'
Plug 'rbong/vim-flog'

" async run
Plug 'skywind3000/asyncrun.vim'

" function signature hint
Plug 'ray-x/lsp_signature.nvim'

" dap
Plug 'Pocco81/DAPInstall.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-neotest/nvim-nio'

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

Plug 'mildred/vim-bufmru'


Plug 'folke/tokyonight.nvim'

Plug 'arsham/arshlib.nvim'
Plug 'famiu/feline.nvim'
Plug 'rebelot/heirline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'arsham/arshamiser.nvim'

Plug 'ap/vim-css-color'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}


Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'

" ui plug
Plug 'MunifTanjim/nui.nvim'

Plug 'folke/noice.nvim'

Plug 'folke/snacks.nvim'

call plug#end()

set termguicolors
"colorscheme dracula
colorscheme tokyonight



set termguicolors
set cursorline
highlight CursorLine cterm=NONE ctermbg=DarkCyan guibg=#718871




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

" nerdcommenter
let g:NERDDefaultAlign = 'left'

" auto pairs
let g:AutoPairsShortcutFastWrap = '<C-e>'

let g:NERDCompactSexyComs = 1

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


  require("noice").setup({
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
  })

require('barbar').setup {

         -- WARN: do not copy everything below into your config!
  --       It is just an example of what configuration options there are.
  --       The defaults are suitable for most people.

  -- Enable/disable animations
  animation = true,

  -- Automatically hide the tabline when there are this many buffers left.
  -- Set to any value >=0 to enable.
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},

  -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
  -- Valid options are 'left' (the default), 'previous', and 'right'
  focus_on_close = 'left',


  -- Disable highlighting alternate buffers
  highlight_alternate = false,

  -- Disable highlighting file icons in inactive buffers
  highlight_inactive_file_icons = false,

  -- Enable highlighting visible buffers
  highlight_visible = true,

  icons = {
    -- Configure the base icons on the bufferline.
    -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
    buffer_index = false,
    buffer_number = false,
    button = '',
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = true},
    },
    gitsigns = {
      added = {enabled = true, icon = '+'},
      changed = {enabled = true, icon = '~'},
      deleted = {enabled = true, icon = '-'},
    },
    filetype = {
      -- Sets the icon's highlight group.
      -- If false, will use nvim-web-devicons colors
      custom_colors = false,

      -- Requires `nvim-web-devicons` if `true`
      enabled = true,
    },
    separator = {left = '▎', right = ''},

    -- If true, add an additional separator at the end of the buffer list
    separator_at_end = true,

    -- Configure the icons on the bufferline when modified or pinned.
    -- Supports all the base icon options.
    modified = {button = '●'},
    pinned = {button = '', filename = true},

    -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
    preset = 'default',

    -- Configure the icons on the bufferline based on the visibility of a buffer.
    -- Supports all the base icon options, plus `modified` and `pinned`.
    alternate = {filetype = {enabled = false}},
    current = {buffer_index = true},
    inactive = {button = '×'},
    visible = {modified = {buffer_number = false}},
  },

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the minimum padding width with which to surround each tab
  minimum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- Sets the minimum buffer name length.
  minimum_length = 0,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- Set the filetypes which barbar will offset itself for
  sidebar_filetypes = {
    -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
    NvimTree = true,
    -- Or, specify the text used for the offset:
    undotree = {
      text = 'undotree',
      align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
    },
    -- Or, specify the event which the sidebar executes when leaving:
    ['neo-tree'] = {event = 'BufWipeout'},
    -- Or, specify all three
    Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
  },

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustment
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,

  -- sorting options
  sort = {
    -- tells barbar to ignore case differences while sorting buffers
    ignore_case = true,
  },

}


require('blame').setup {}

local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event



vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})


vim.api.nvim_set_keymap('', '<S-Insert>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<S-Insert>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<S-Insert>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<S-Insert>', '<C-R>+', { noremap = true, silent = true})

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

require('ufo').setup()



require("toggleterm").setup{
        open_mapping = [[†]],
}


-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd.colorscheme("arshamiser_light")

vim.cmd [[highlight CocHighlightText ctermfg=white ctermbg=none guifg=#FFFFFF guibg=#3C3836]]

require("arshamiser.feliniser")
    -- or:
    -- require("arshamiser.heirliniser")

_G.custom_foldtext = require("arshamiser.folding").foldtext
vim.opt.foldtext = "v:lua.custom_foldtext()"
    -- if you want to draw a tabline:
vim.api.nvim_set_option("tabline", [[%{%v:lua.require("arshamiser.tabline").draw()%}]])

last_tab = vim.api.nvim_get_current_tabpage()

function tabnew()
        last_tab = vim.api.nvim_get_current_tabpage()
        vim.api.nvim_command("tabnew")
end

function tabnext()
        last_tab = vim.api.nvim_get_current_tabpage()
        vim.api.nvim_command("tabnext")
end

function tabprev()
        last_tab = vim.api.nvim_get_current_tabpage()
        vim.api.nvim_command("tabprev")
end

function tabswitch()
        local_last_tab = vim.api.nvim_get_current_tabpage()
        vim.api.nvim_set_current_tabpage(last_tab)
        last_tab = local_last_tab
end


local last_buffer = 0

function bufnext()
        last_buffer = vim.fn.bufnr('%')
        print(last_buffer)
        vim.api.nvim_command("BufferNext")
end

function bufprev()
        last_buffer = vim.fn.bufnr('%')
        print(last_buffer)

        vim.api.nvim_command("BufferPrevious")
end

-- 切换到上一次的标签页
function bufswitch()
    local_last_buffer = vim.fn.bufnr('%')
    vim.cmd('buffer ' .. last_buffer)
        last_buffer = local_last_buffer
end


if vim.fn.has('wsl') then
  vim.cmd [[
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
  ]]
end


local git_menu = Menu({
  position = "100%",
  size = {
    width = 50,
    height = 50,
  },
  border = {
    style = "single",
    text = {
      top = "[Git Menu]",
      top_align = "center",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal,FloatBorder:Normal",
  },
}, {
  lines = {
    Menu.item("Git blame"),
    Menu.item("Git diffview file history"),
    Menu.item("Git log"),
    Menu.item("cancel"),
  },
  max_width = 20,
  keymap = {
    focus_next = { "j", "<Down>", "<Tab>" },
    focus_prev = { "k", "<Up>", "<S-Tab>" },
    close = { "<Esc>", "<C-c>" },
    submit = { "<CR>", "<Space>" },
  },
  on_close = function()
    print("Menu Closed!")
  end,
  on_submit = function(item)

    if item.text == "Git blame" then
      vim.cmd("BlameToggle")
    end

    if item.text == "Git diffview file history" then
      vim.cmd("DiffviewFileHistory %")
    end

    if item.text == "Git log" then
      vim.cmd("Flog")
    end

    print("Menu Submitted: ", item.text)
  end,
})

-- mount the component



function GitUi()
        git_menu:mount()
end

vim.api.nvim_create_user_command(
    'Ui',
    function(opts)
        local arg = opts.args
        if arg == "git" then
                GitUi()
        end

    end,
    { nargs = 1, desc = "Open Git UI with an argument" }
)


function FileFmt()
        local file_type = vim.bo.filetype
        if file_type == "go" then
                vim.api.nvim_exec([[GoImports]],true)
                return
        end
        vim.api.nvim_exec([[call CocActionAsync('format')]],true)
        vim.api.nvim_exec([[update]],true)
end

function DapDebug()
        require('dap.ext.vscode').load_launchjs(nil, nil)
        local file_type = vim.bo.filetype
        if file_type == "go" then
                require"dap".continue()
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


-- function TableString(tab, max_indent, append_str)
--      max_indent = max_indent or 3
--      append_str = append_str or ""
--      local res = append_str or ""
--
--      local loopTableDict = {}
--
--      local _tableString
--      function _tableString(t, indent)
--              if t == nil then
--                      return "~nil"
--              elseif type(t) == "table" then
--                      if loopTableDict[t] then
--                              return "{loopTable}"
--                      elseif indent < max_indent then
--                              loopTableDict[t] = true
--
--                              local strs = {"{"}
--
--                              for k,v in pairs(t) do
--                                      local key = k
--                                      if tonumber(key) ~= nil then
--                                              key = "[" .. key .. "]"
--                                      end
--                                      table.insert( strs, string.rep("    ",indent+1) .. key .. "=" .. _tableString(v, indent + 1))
--                              end
--
--                              table.insert(strs, string.rep("    ", indent) .. "}")
--
--                              return table.concat(strs, "\n")
--                      else
--                              return tostring(t)
--                      end
--              elseif type(t) == "string" then
--                      return '"' .. t .. '"'
--              else
--                      return tostring(t)
--              end
--      end
--
--      return res .. _tableString(tab, 0)
--
-- end

require'nvim-treesitter.configs'.setup {
                highlight = {
                enable = true,
                },
}

vim.api.nvim_set_hl(0,'GitSignsAdd',{link='GitGutterAdd'})

-- Gitsigns
require('gitsigns').setup {
        signs = {
          add = {  text = '+' },
          change = {  text = '*' },
          delete = {  text = '-' },
          topdelete = {  text = '‾' },
          changedelete = {  text = '~' },
          },
        numhl = true,
        sign_priority = 6,


        watch_gitdir = {
                interval = 1000,
                follow_files = true
                },
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 100,
                ignore_whitespace = false,
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

linehl = true
}

vim.o.signcolumn = 'yes'


require('dap-go').setup()
require('dap-python').setup('python')

local dap = require('dap')

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='➡️', texthl='', linehl='', numhl=''})


dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/opt/nvim-cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

require("dapui").setup()


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

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

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
require("auto-save").setup {
    enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
    execution_message = {
                message = function() -- message to print on save
                        return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
                end,
                dim = 0.18, -- dim the color of `message`
                cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
        },
    trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
        -- function that determines whether to save the current buffer or not
        -- return true: if buffer is ok to be saved
        -- return false: if it's not ok to be saved
        condition = function(buf)
                local fn = vim.fn
                local utils = require("auto-save.utils.data")

                if
                        fn.getbufvar(buf, "&modifiable") == 1 and
                        utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                        return true -- met condition(s), can save
                end
                return false -- can't save
        end,
    write_all_buffers = false, -- write all buffers when the current one meets `condition`
    debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
        callbacks = { -- functions to be executed at different intervals
                enabling = nil, -- ran when enabling auto-save
                disabling = nil, -- ran when disabling auto-save
                before_asserting_save = nil, -- ran before checking `condition`
                before_saving = nil, -- ran before doing the actual save
                after_saving = nil -- ran after doing the actual save
        }
}

-- indentation

-- vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})


 -- require("ibl").setup()
 -- local highlight = {
 --     "RainbowRed",
 --     "RainbowYellow",
 --     "RainbowBlue",
 --     "RainbowOrange",
 --     "RainbowGreen",
 --     "RainbowViolet",
 --     "RainbowCyan",
 -- }
 --
 -- local hooks = require "ibl.hooks"
 -- -- create the highlight groups in the highlight setup hook, so they are reset
 -- -- every time the colorscheme changes
 -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
 --     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
 --     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
 --     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
 --     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
 --     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
 --     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
 --     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
 -- end)
 --
 -- require("ibl").setup { indent = { highlight = highlight } }

require("ibl").setup()


-- init.lua

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`


function get_files_in_tab(tabpage)
    local files = {}
    local windows = vim.api.nvim_tabpage_list_wins(tabpage)

    for _, win in ipairs(windows) do
        local buf = vim.api.nvim_win_get_buf(win)
        local file_name = vim.api.nvim_buf_get_name(buf)

        -- exclude buffers without names
        if file_name ~= '' then
            table.insert(files, file_name)
        end
    end

    return files
end

-- get all files in all tabs
function get_all_files_in_tabs()
    local all_files = {}
    local tabpages = vim.api.nvim_list_tabpages()

    for _, tabpage in ipairs(tabpages) do
        local files_in_tab = get_files_in_tab(tabpage)
        all_files[tabpage] = files_in_tab
    end

    return all_files
end


function tree_open_file()

        local file_path = require("nvim-tree.api").tree.get_node_under_cursor().absolute_path

        local all_files = get_all_files_in_tabs()

        for tabpage, files in pairs(all_files) do
                for _, file in ipairs(files) do
                        if file == file_path then
                                vim.api.nvim_set_current_tabpage(tabpage)
                                return
                        end
                end
        end

        require("nvim-tree.api").node.open.tab()
end

local function my_on_attach(bufnr)
        -- custom mappings
        local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    local api = require "nvim-tree.api"
    api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', '<CR>', tree_open_file,         opts('Up'))
        vim.keymap.set('n', '<C-t>', tree_open_file,        opts('Up'))

end

require'nvim-tree'.setup {
        open_on_tab=true,
        -- auto_close=true,
       }


vim.opt.termguicolors = true


vim.api.nvim_set_keymap('n', '<Leader>t', ':lua SwitchToLastTab()<CR>', { noremap = true, silent = true })

-- Auto save session
require("persistence").setup {
        dir =  vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
        options = {"buffers", "curdir", "tabpages", "winsize"},
        pre_save =
        function()
                -- 如果布局有改变，就返回true，否则返回false
                return vim.fn.haslocaldir() == 1 or vim.fn.winnr("$") > 1
        end
        }

-- 恢复当前目录下的会话
vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})
-- 恢复上次的会话
vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({last = true})<cr>]], {})
-- 停止会话保存
vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})

EOF
