" for pathogen, enable pathogen
execute pathogen#infect()

" plugins installed via pathogen:
" - vim-buftabline (or vim-airline, or bufexplorer)
" - nerdcommenter
" - nerdtree
" - supertab
" - syntastic
" - tabbar
" - vim-nerdtree-tabs
" - vim-cpp-enhanced-highlight
" - vim-fswitch
" - vim-indent-guides

" packages installed via 'apt-get':
" - vim-youcompleteme
" - vim-vimoutliner
" - vim-syntastic
" - vim-pathogen
" - vim-addon-manager
" - vim-autopep8
" - vim-fugitive
" - vim-snippets
" - vim-conque
" - exuberant-ctags

" enable syntax highlighting, use ':highlight' to select hightlighting
syntax enable

" overrule customized setting with the defaults
syntax on

" colorcolumn
set cc=80
" :help ctermbg for color, for GVim. set guibg
highlight ColorColumn ctermbg=0

" show line number
set nu

" set file encoding, abbr. for 'fileencoding'
set fenc=utf-8

" enable filetype detection
"filetype on
" enable loading the indent file for detected types
"filetype indent on
" enable loading plugin files for detected types
"filetype plugin on
" == filetype on + filetype plugin on + filetype indent on
filetype plugin indent on

" highlight search
set hlsearch
" ignore case in search
set ignorecase
" only case-sensitive if the search word contain upper-case
set smartcase
set incsearch
" disable wrap scan, enabled by default
"set nowrapscan
set wrapscan

" highlight current line
set cursorline
" highlight current column
"set cursorcolumn

" enable auto indent: use indent from previous line
set autoindent
" enable smart indent, like 'autoindent' but also recognize c syntax
set smartindent
" work more clever than 'autoindent' and 'smartindent', abbr of 'cindent'
" it is configurable
set cin

" only use tab (not spaces) for indentation, space for alignment
" - noexpandtab
" - copyindent: copy the structure of the existing lines indent when
"   autoindenting a new line
" - preserveindent: when changing the indent of the current line, preserve as
"   much of the indent structure as possible
" - softtabstop=0
" - shiftwitdth=4
" - tabstop=4
"set noet ci pi sts=0 sw=4 ts=4

" number of spaces for a tab, abbr of 'tabstop'
set ts=4
" set the number of spaces for a expanding a tab, abbr of 'shiftwidth'
set sw=4
" treat continuous spaces as a tab
set softtabstop=4
" expand tab to space
set expandtab
" use shiftwidth instead of tabstop at the start of lines
set smarttab
set copyindent
set preserveindent

" no compatible with vi
set nocompatible
set nowrap
set magic

" reset the <leader> and timeout, use for shortcut
let mapleader=","  " default is /
set timeout timeoutlen=1500

" show match bracket
set showmatch
set pastetoggle=<F3>

"VIM console autocomplete
set wildmenu
set wildmode=list:longest,full

" folding stype ('help: foldmethod'):
" manual
" indent
" exp
" syntax
" dif
" marker
" zo, zc, za - open, close, toggle one folding level (at the cursor)
" zO, zC, zA - open, close, toggle all folding level (at the cursor)
set foldmethod=indent " fdm for short
set foldcolumn=4 " fdc for short
" default is 0 - open buffers with all folds closed,
" set it to 99 - open buffers with no folds closed
set foldlevel=9 " fdl for short
" disable folding when vim starts
"set nofoldenable " nofen for short

" access system clipboard: '+y' or '*y'
set clipboard=unnamedplus


" enable mouse for all modes, refer ':help mouse'
" in VIM 7.4, right click enable visual mode by default, so use 'mouse-=a'
set mouse-=a

" dislay tab and white space
set list

" set the style of tab and white space: tab->"|", tail white space->"-"
set lcs=tab:>-,trail:-,nbsp:%

" set the tab at the begininng of line as gray
highlight LeaderTab guifg=#666666

" match the tab at the beginning of line
match LeaderTab /^\t/

" set the style of statusline
if has('statusline')
    set laststatus=2
    set statusline=%<%f\   " file name
    set statusline+=%w%h%m%r " options
    set statusline+=%{fugitive#statusline()} "Git
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    "set statusline+=%=%-14.(%l,%c%V%)\ %p%%\ %L  " Right aligned file nav info
    set statusline+=%=\ \ %5l,%-3c\ %3p%%\ %5L  " row,column percentage total line
endif


" autocomplete
" enable omni completion
" <C-N>, <C-P>, <C-X><C-O>
filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" auto wrapper at column 72 for git commit message
au FileType gitcommit set tw=72

" run NERDTreeTabs on console vim startup
"let g:nerdtree_tabs_open_on_console_startup=1
nmap <F9> :NERDTreeToggle<CR>

" recommended configuration for Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" always sticks any detected errors into the location list
let g:syntastic_always_populate_loc_list=1
" automatically open and/or close the location list, default is 2
" use :lopen/:lclose to open/close this window.
let g:syntastic_auto_loc_list=1
" syntax checks when buffers are first loaded and saved, default is 0
let g:syntastic_check_on_open=1
" syntax checks whenever buffers are written to disk, default is 1
let g:syntastic_check_on_wq=1
let g:syntastic_cpp_compiler='g++'
let g:syntastic_cpp_compiler_options='-std=c++11'


" shortcut for tagbar
nmap <F8> :TagbarToggle<CR>
" tabbar on left windows
"let tabbar_left=1
" tabbar width
let tabbar_width=32
" no superfluous help info in tabbar
let g:tabbar_compact=1
" setting for generation of ctags lables
let g:tabbar_type_cpp = {
    \ 'kinds' : [
        \ 'c:classes:0:1',
        \ 'd:macros:0:1',
        \ 'e:enumerators:0:0',
        \ 'f:functions:0:1',
        \ 'g:enumeration:0:1',
        \ 'l:local:0:1',
        \ 'm:members:0:1',
        \ 'n:namespaces:0;1',
        \ 'p:functions_prototypes:0:1',
        \ 's:structs:0:1',
        \ 't:typedefs:0:1',
        \ 'u:unions:0:1',
        \ 'v:global:0:1',
        \ 'x:external:0:1'
    \ ],
    \ 'sro'         : '::',
    \ 'kind2scope'  : {
        \ 'g' : 'enum',
        \ 'n' : 'namespace',
        \ 'c' : 'class',
        \ 's' : 'struct',
        \ 'u' : 'union'
    \ },
    \ 'scope2kind'  : {
        \ 'enum'        : 'g',
        \ 'namespace'   : 'n',
        \ 'class'       : 'c',
        \ 'struct'      : 's',
        \ 'union'       : 'u'
    \ }
\ }


" shortcuts for bufexplorer
"nnoremap <silent> <F7> :ToggleBufExplorer<CR>
"nnoremap <silent> <F7> :BufExplorer<CR>
"nnoremap <silent> <s-F7> :ToggleBufExplorer<CR>
"nnoremap <silent> <m-F7> :BufExplorerHorizontalSplit<CR>
"nnoremap <silent> <c-F7> :BufExplorerVerticalSplit<CR>

" DoxygenToolkit.vim
let g:DoxygenToolkit_authorName="Ben Guan <Ben.Guan@cn.bosch.com>"


" setting for vim-indent-guides
"let g:indent_guides_enable_on_vim_startup=1     " enable when vim starts
let g:indent_guides_start_level=2               " show visual indent from level 2
let g:indent_guides_guide_size=1                " color block width
" on/off visual indent
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" Shortcuts to switch between files:
" Work with buffers
"nnoremap <C-Tab> :bn<CR>
"nnoremap <C-S-Tab> :bp<CR>
" Work with split windows
"nnoremap <C-Tab> <C-w>w
"nnoremap <C-S-Tab> <C-w>W
" One tab for one buffer
"nnoremap <C-Tab> :tabn<CR>
"nnoremap <C-Tab> :tabp<CR>

" shortcuts
"nmap LB 0   " go to line begin
"nmap LE $   " go to line end
"nnoremap nw <C-W><C-W>         " iterate windows in turns
"nnoremap <Leader>lw <C-W>l     " go to right window
"nnoremap <Leader>hw <C-W>h     " go to left window
"nnoremap <Leader>kw <C-W>k     " go to upper window
"nnoremap <Leader>jw <C-W>j     " go to lower window

" switch between *.cpp and *.h, requires 'vim-fswitch'
nmap <silent> <Leader>sw :FSHere<cr>

" nerdcommenter shortcuts
" <Leader>cc - comment current line or selected text
" <Leader>cu - uncomment current line or selected text

" YCM settings
"nnoremap <Leader>jc :YcmCompleter GoToDeclaration<CR>
"nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>
