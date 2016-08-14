"--------------基本设置----------------------
"1. Set up Vundle first:
"$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"2. move this config file into ~/.vimrc
"3. open vim, ignore warnings, in cmd mode, ``:PluginInstall``
"4. cd ~/.vim/bundle/YouCompleteMe/
"5. run ``./install.py``

syntax on
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.UTF-8
language messages zh_CN.UTF-8
set clipboard=unnamed
set foldlevel=99
set ruler
set showcmd
set number
set mouse-=a
set hlsearch
"自动切换目录
set acd
set backspace=indent,eol,start
set autoindent " same level indent
set smartindent " next level indent
set sw=4 sts=4 
set sta
set expandtab
autocmd FileType python setlocal foldmethod=indent
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType go setlocal ts=4
autocmd FileType mkd setlocal et sta sw=4 sts=4
autocmd FileType yaml setlocal sw=2 sts=2


"----------------快捷键-----------------
"按kj 从insert模式切换到normal模式
inoremap kj <Esc>
set pastetoggle=<F12>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>


"重定义<leader>
let mapleader = ','
let g:mapleader = ','
let maplocalleader = ','
noremap H 0
noremap L $

map <leader>y "+y
map <leader>p "+p

"----------------vundle 插件管理---------------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"+++++++ tagbar [tag列表] ++++++++++
Plugin 'majutsushi/tagbar'

"+++++++ autotag [自动tag] ++++++++++
Plugin 'craigemery/vim-autotag'

"+++++++ vim-go [插件] +++++++
Plugin 'fatih/vim-go'

"+++++++ Python Mode [插件] ++++++
Plugin 'klen/python-mode'

"+++++++ 主题颜色 [插件] +++++++
Plugin 'altercation/vim-colors-solarized'

"+++++++ 浏览文件夹 [插件] +++++++
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'

"+++++++ 状态栏 [插件] +++++++
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


"+++++++ 括号匹配 [插件] +++++
Plugin 'kien/rainbow_parentheses.vim'

"+++++++ tab 提示 [插件] +++++
Plugin 'nathanaelkane/vim-indent-guides'

"+++++++ 自动匹配 [插件] +++++
Plugin 'Valloric/YouCompleteMe'

"+++++++ 引号括号配对 [插件] +++++
Plugin 'Raimondi/delimitMate'

"+++++++ 自动注释 [插件] ++++
Plugin 'scrooloose/nerdcommenter'

"+++++++ 引号括号环绕 [插件] +++
Plugin 'tpope/vim-surround'

"+++++++ python 高亮 [插件] +++ 
Plugin 'hdima/python-syntax'

"+++++++ 扩展选定区域 [插件] +++
Plugin 'terryma/vim-expand-region'

"+++++++ clojure 相关插件 +++
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-fireplace'
Plugin 'clojure-emacs/cider-nrepl'

"+++++++ repeat +++
Plugin 'tpope/vim-repeat'

"+++++++ auto-save +++
Plugin '907th/vim-auto-save'


call vundle#end()            " required
filetype plugin indent on    " required



"+++++++ 主题颜色 [配置]+++++++
syntax enable
set t_Co=256
colorscheme solarized
hi Normal ctermbg=0
"hi LineNr ctermbg=233
hi CursorLine ctermbg=8
hi TabLine ctermbg=8
hi Pmenu ctermbg=11 ctermfg=00
hi PmenuSel ctermbg=00 ctermfg=10


"+++++++ 浏览文件夹 [配置] +++++++
autocmd vimenter * NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_focus_on_files=1

"++++++ airline 状态栏 [配置] +++++++++++++
" iterm2 需要在设置中指定安装的字体（https://github.com/powerline/fonts）
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '$'
let g:airline#extensions#tabline#left_alt_sep = '￥'



"+++++++++ 括号 [配置] ++++++++
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ]

"++++++++ tab 提示 [配置] ++++++++++
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

"++++++++ python 高亮 [配置] +++++++
let python_highlight_all = 1

"+++++++ delimitMate [配置] +++++
imap <C-l> <Plug>delimitMateS-Tab

"+++++++ nerd tree git [配置] +++
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"++++++ auto save config +++++
let g:auto_save = 1 " 开启自动保存
let g:auto_save_in_insert_mode = 0 "插入模式下不保存


"++++++ python-mode config +++++
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0

"+++++ tagbar config +++++++++++
nmap <Leader>t :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='ctags'         "ctags程序的路径
let g:tagbar_width=30                  "窗口宽度的设置
"map <F3> :Tagbar<CR>
"如果是py,go,c语言的程序的话，tagbar自动开启"
autocmd BufReadPost *.py,*.go,*.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

"+++++ vim-go config+++++++++
let g:go_fmt_autosave = 0
