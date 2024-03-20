"----基础配置----"
" 显示行数
set nu 
set relativenumber
" 语法高亮
syntax enable 
syntax on
" 缩进长度
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
" 设置粘贴版
set clipboard=unnamedplus,unnamed
set ignorecase
set scrolloff=5
set history=200

"----配置主题----
colorscheme default

" " 插件设置
" "----插件列表----
" call plug#begin('~/.vim/plugged')
" Plug 'airblade/vim-gitgutter'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'preservim/nerdtree'
" Plug 'wojciechkepka/vim-github-dark'
" Plug 'luochen1990/rainbow'
" Plug 'Yggdroot/indentLine'
" Plug 'liuchengxu/vim-which-key'
" Plug 'easymotion/vim-easymotion'
" call plug#end()
"
" "----配置airline状态栏----
" set laststatus=2  "永远显示状态栏
" let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#enabled=1
" let g:airline_theme='mytheme'
" 
" if !exists('g:airline_symbols')
" 	let g:airline_symbols = {}
" endif
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ' :'
" 
" "----启动彩虹括号----
" let g:rainbow_active = 1
" 
" "----indentline插件设置----
" let g:indentLine_enable = 1
" let g:indentLine_char = '¦'
" let g:indentLine_conceallevel = 2
