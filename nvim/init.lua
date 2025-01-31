require("config.lazy")


vim.cmd([[
set clipboard=unnamed
"set relativenumber
set number
set incsearch
set mouse=a
set fileencodings=utf-8,gbk
set ff=unix

set completeopt-=preview
set completeopt-=menu

hi      NvimTreeExecFile    guifg=#ffa0a0
hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
hi      NvimTreeSymlink     guifg=Yellow  gui=italic
hi link NvimTreeImageFile   Title
]])


vim.cmd([[set termguicolors ]])
vim.cmd([[set cursorline]])

vim.cmd([[highlight CursorLine cterm=NONE ctermbg=DarkCyan guibg=#718871]])

vim.cmd [[colorscheme tokyonight]]


--vim.cmd([[ nnoremap <F2> :Neotree toggle<cr> ]])
vim.cmd([[ nnoremap <F2> :NvimTreeToggle<cr> ]])

--vim.cmd([[ autocmd VimEnter * Neotree toggle<cr> ]])
--vim.cmd([[ autocmd VimEnter * NvimTreeToggle ]])

-- key maps
--
vim.cmd([[ noremap <F7> :lua require'dap'.step_into()<CR> ]])

vim.cmd([[ noremap <F8> :lua require'dap'.step_over()<CR> ]])
vim.cmd([[ noremap <F9> :lua require'dap'.continue()<CR>  ]])



vim.cmd([[ noremap <leader>- :lua tabprev()<CR>]])

vim.cmd([[ noremap <leader>= :lua tabnext()<CR>]])

vim.cmd([[ noremap <A--> :lua bufprev()<CR>]])

vim.cmd([[ noremap <A-=> :lua bufnext()<CR>]])

vim.cmd([[ noremap ≠ :lua bufnext()<CR>]])

vim.cmd([[ noremap – :lua bufprev()<CR>]])

vim.cmd([[ noremap <leader><tab> :lua bufswitch()<CR>]])

vim.cmd([[ noremap <leader>b :lua require'dap'.toggle_breakpoint()<CR>]])
vim.cmd([[ noremap <leader>c :lua DapDebug()<CR>]])

vim.cmd([[ noremap <leader>d :lua require("dapui").toggle()<CR>]])


vim.cmd([[ noremap <leader>s :lua require("dapui").eval()<CR>]])

vim.cmd(
[[ noremap <leader>w :lua local widgets =  require('dap.ui.widgets'); widgets.centered_float(widgets.scopes)<CR>]])

vim.cmd([[ noremap <leader>g :G<CR>]])

vim.cmd([[ noremap <leader>im :lua require'telescope'.extensions.goimpl.goimpl{}<CR>]])
vim.cmd([[ nnoremap <C-d> 15j]])
vim.cmd([[ vnoremap <C-d> 15j]])
vim.cmd([[ nnoremap <C-u> 15k]])
vim.cmd([[ vnoremap <C-u> 15k]])


-- vim.cmd([[ nmap <leader><F6> <Plug>(coc-rename)]])
vim.cmd([[noremap <leader>q :q!<cr>]])
vim.cmd([[noremap <C-s> :lua vim.lsp.buf.format({ async = true })<CR>]])
vim.cmd([[imap <C-s> <cmd>lua FileFmt()<CR>]])

vim.cmd([[noremap <C-r> :%s/]])
vim.cmd([[vmap <C-r> :s/]])


-- go map

vim.cmd([[noremap <leader><CR> :GoFillStruct<CR>]])
vim.cmd([[noremap <leader>` :GoAddTags json yaml<CR>]])



vim.cmd([[map <A-/> <plug>NERDCommenterToggle]])
vim.cmd([[map ÷ <plug>NERDCommenterToggle]])
vim.cmd([[nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep({cwd=FilePath()})<cr>]])
vim.cmd([[nnoremap <leader><C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>]])
vim.cmd([[nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>]])

--vim.cmd([[nnoremap <leader><F1> <cmd>Neotree reveal<cr>]])
vim.cmd([[nnoremap <leader><F1> <cmd>NvimTreeFindFile<cr>]])

vim.cmd([[nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>]])

-- compatible windows terminal
vim.cmd([[noremap  :tabnew<CR>]])
vim.cmd([[noremap tabp<CR>]])
vim.cmd([[noremap  :tabn<CR>]])


vim.cmd(
[[command DebugW lua local widgets = require('dap.ui.widgets');local my_sidebar = widgets.sidebar(widgets.scopes);my_sidebar.open();local widgets = require('dap.ui.widgets');local my_sidebar = widgets.sidebar(widgets.frames);my_sidebar.open();]])


vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })


vim.api.nvim_set_keymap('', '<S-Insert>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<S-Insert>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<S-Insert>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Insert>', '<C-R>+', { noremap = true, silent = true })


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

function FileFmt()
        local file_type = vim.bo.filetype
        if file_type == "go" then
                require("go.format").goimports()
                return
        end

	vim.lsp.buf.format({ async = true })
        --vim.api.nvim_exec([[call CocActionAsync('format')]], true)
        --vim.api.nvim_exec([[update]], true)
end
