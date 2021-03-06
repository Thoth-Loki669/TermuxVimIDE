set nocompatible
filetype off 
syntax on
set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set nosmd 
set noru
set splitbelow 

"Handle autocompletion problems by loading plugins conditionally
let $ac = expand('%:e') "read file extensions

call plug#begin('~/.vim/bundle')
Plug 'vim-syntastic/syntastic'
Plug 'luochen1990/rainbow'
Plug 'Shadowsith/vim-syntax'
"Plug 'vim-scripts/SingleCompile'

"Mucomplete crashes with completor and javacomplete, so only plugs for other
"filetypes
if $ac != "c" || $ac != "cpp" || $ac != "c++" || $ac != "h" || $ac != "hpp" || $ac != "php" || $ac != "js" || $ac != "py"
    Plug 'lifepillar/vim-mucomplete' 
endif
"Plug 'lifepillar/pgsql.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'maralla/completor.vim', { 'for': ['cpp', 'c', 'php', 'js', 'py'] }
"Plug 'scrooloose/nerdtree'
"Plug 'jistr/vim-nerdtree-tabs'
Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua' } "lua autocompletion
Plug 'xolox/vim-misc' "needed for lua-autocompletion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'majutsushi/tagbar'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
"Plug 'jason0x43/vim-js-indent'
Plug 'nanotech/jellybeans.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'ternjs/tern_for_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'othree/html5.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'jiangmiao/auto-pairs' 
"Plug 'alvan/vim-closetag'
"Plug 'maksimr/vim-jsbeautify'
"Plug 'lervag/vimtex'
Plug 'xolox/vim-notes'
Plug 'Shougo/denite.nvim'
Plug 'terryma/vim-expand-region'
Plug '~/.vim/bundle/Conque-GDB'
"Plug 'vim-vdebug/vdebug', {'for' : ['py', 'php'] }
call plug#end()
call plug#helptags() 

"Jellybeans colorscheme
call settingloader#Jellybeans()

"Vim-Airline (Userinterface)
call settingloader#Airline() 

"Rainbow brakets
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"Vim Notes
let g:notes_directories = ['~/.notesvim']


"Nerdtree
map <C-n> :NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Tagbar 
map <C-t> :TagbarToggle<CR>
let g:tagbar_phpctags_bin='/usr/bin/phpctags'
let g:tagbar_phpctags_memory_limit = '256M'

"Syntatisc
call settingloader#Syntastic()

nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

"Various Hotkeys
nmap <F2> :call hotkeys#LineNumbers()<cr>
nmap <F3> :call hotkeys#AutoIndent()<cr>
nmap <F4> :call hotkeys#IndentLine()<cr> 
nmap <S-s> :w<cr>
nmap <C-Right> :tabn<cr>
nmap <C-Left> :tabp<cr>

"Aliases
call alias#SetupCommandAlias("GDB","ConqueGdb -q")
call alias#SetupCommandAlias("gdb","ConqueGdb -q")

"µComplete for various filetypes
call settingloader#MuComplete()

"completor for C-Familiy, JavaScript, Python
call settingloader#Completor()

"vim-lua-ftplugin for Lua-Autocompletion
call settingloader#LuaComplete()

"pgsql Plugin
"let g:sql_type_default = 'pgsql' "If you want use this plugin for all sql files

"vim-cpp-enhanced-highlight
call settingloader#CppEnhancedHighlight()

"Vim buildin omnicompletion"
call settingloader#VimOmniCompletion()

"Vim snippets for many languages
call settingloader#Snippets()

"SearchTasks
call settingloader#SearchTasks()
