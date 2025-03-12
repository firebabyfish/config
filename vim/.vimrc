" 行号
set number
" 相对行号
" set relativenumber
" 光标行列信息
set ruler
" 禁止折行
set nowrap
" cmd时显示输入内容
set showcmd
" 设置历史记录条数
set history=1000
" 禁止备份
" set nobackup
" 禁止生成临时文件
" set noswapfile
" 匹配模式
set showmatch
" 设置C/C++方式自动对齐
set autoindent
set cindent
" 允许鼠标操作
" set mouse=a
" 剪贴板互通
set clipboard=unnamedplus
" 自动语法高亮
syntax enable
syntax on
" 指定配色方案为256
set t_Co=256
" 设置搜索时忽略大小写
set ignorecase
" 设置Tab宽度
set tabstop=4
" 设置自动对齐空格数
set shiftwidth=4
" 设置退格键可一次删除4格
set softtabstop=4
set smarttab
" Tab为空格
set expandtab
" 编码方式
set encoding=utf-8
" 上下保留行数
set scrolloff=8
" 设置高亮
set hls
" 显示标签页
set showtabline=2
" 显示文件名
set laststatus=2
" 搜索高亮
set hlsearch
set incsearch
" 匹配括号高亮的时间
set matchtime=1
" 设置desert高亮
" colorscheme desert
" 关闭兼容模式
" set nocompatible
" 设置退格键可用
set backspace=indent,eol,start
" 去掉欢迎界面
set shortmess=atI
" 关闭提示音
set vb t_vb=

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'machakann/vim-highlightedyank', 
Plug 'preservim/nerdtree'

call plug#end()

" highlightedyank
if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
endif
let g:highlightedyank_highlight_duration = 250
" highlight HighlightedyankRegion cterm=reverse gui=reverse

colorscheme desert

" INSERT
inoremap jk <esc>
inoremap <C-b> <left>
inoremap <C-f> <right>

" NORMAL
nnoremap <space>b :buffers<cr>:b<space>
nnoremap <space>o :b#<cr>
nnoremap <space>w :w<cr>
nnoremap <space>q :q<cr>
nnoremap <S-j> 8j
nnoremap <S-k> 8k
nnoremap <C-h> :tabp<cr>
nnoremap <C-l> :tabn<cr>
nnoremap <space>a :tabedit 
nnoremap <space>ss :split 
nnoremap <space>sv :vsplit 
nnoremap <space>r :%s///g<left><left><left>
nnoremap <space>n :noh<cr>

nnoremap <space>i <Plug>(coc-definition)

nnoremap <space>f <cmd>FZF<cr>

nnoremap <space>e <cmd>NERDTreeToggle<cr>

" VISUAL

" COMMAND
cnoremap jk <esc>
cnoremap <C-b> <left>
cnoremap <C-f> <right>

