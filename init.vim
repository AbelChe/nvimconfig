" leader键 需要在使用leader键的设置之前
let mapleader=","
let g:mapleader=","


" >>> Plugins and plugins settings >>>
call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'inkarkat/vim-mark'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"" >>> preservim/nerdtree >>>
map <c-b> :NERDTreeToggle<CR>
imap <c-b> <ESC>:w<CR>:NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"" <<< preservim/nerdtree <<<
"" >>> vim-airline/vim-airline >>>
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"" <<< vim-airline/vim-airline <<<
"" >>> preservim/nerdcommenter >>>
""" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"" <<< preservim/nerdcommenter <<<
"" >>> nathanaelkane/vim-indent-guides >>>
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 4
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=238 ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=241 ctermbg=241
"" <<< nathanaelkane/vim-indent-guides <<<
"" nvim-telescope/telescope.nvim >>>
""" TIPS: Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"" <<< nvim-telescope/telescope.nvim <<<
" <<< Plugins and plugins settings <<<

" >>> 自定义快捷键 >>>
"" >>> 行号显示模式 >>>
nmap <F2> :set relativenumber!<CR>
imap <F2> <C-O>:set relativenumber!<CR>
"" <<< 行号显示模式 <<<
"" >>> 全选 >>>
nmap <C-a> <ESC>ggvG$
"" <<< 全选 <<<
"" >>> ctrl s为保存 >>>
nmap <C-s> <ESC>:w<CR>
imap <C-s> <C-O>:w<CR>
"" <<< ctrl s为保存 <<<
"" >>> 快速切换buffer >>>
nmap <leader>] :bn<CR>
nmap <leader>[ :bp<CR>
"" <<< 快速切换buffer <<<
"" >>> 快速切换tab >>>
nmap <leader>} :tabnext<CR>
nmap <leader>{ :tabprevious<CR>
"" <<< 快速切换tab <<<
" <<< END 自定义快捷键 <<<

" >>> 其他设置 >>>
filetype plugin indent on

syntax on

set mouse=a

"set helplang=cn
"设置为双字宽显示，否则无法完整显示如:☆
"set ambiwidth=double
"光标移动到buffer的顶部和底部时保持n行距离
set scrolloff=7
set backspace=2

"总是显示状态行
set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab
"一个tab键所占的列数，linux 内核代码建议每个tab占用8列
"set tabstop=4
"敲入tab键时实际占有的列数
"set softtabstop=4
"shiftwidth用于设置Tab键宽度
"set shiftwidth=4
"expandtab用于将Tab转化为空格
"set expandtab
"ts用于设置tab键表示的空格数
"set ts=4

"显示不可见字符
set listchars=tab:►-,trail:◦
set list

"高亮搜索的关键词
set hlsearch

"显示行号
set number
"设置行号显示模式为相对
set relativenumber

set nobackup
set nowritebackup

"显示纵向标尺
set ruler

"set showcmd

"换行不添加注释
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" >>> 设置颜色 >>>
set cursorline cursorcolumn
se t_Co=256
colorscheme gruvbox
set background=dark
highlight Normal       ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" highlight LineNr       ctermbg=232 ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorLineNr ctermbg=131 ctermfg=215 guibg=NONE guifg=NONE
highlight CursorLine   ctermbg=238 ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorColumn ctermbg=238 ctermfg=NONE guibg=NONE guifg=NONE
highlight Search       ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
"" <<< 设置颜色 <<<
" <<< 其他设置 <<<
" 自定义方法
"" >>> 随时高亮当前相同词 >>>
set updatetime=10

function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
"" <<< 随时高亮当前相同词 <<<

"" >>> 从上次打开的地方打开 >>>
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif
"" <<< 从上次打开的地方打开 <<<

