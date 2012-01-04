"一般设置
"set nocompatible "VIM而不是VI
set history=50 "历史记录50条
set fenc=utf-8 "设置默认语言为8位unicode
"man Q gq "屏蔽Q, 以免进入Ex模式
filetype on "打开文件类型检测
set cursorline "高亮当前行
"配置高亮颜色
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white 
"set hls "查找文本高亮
set nu
"显示tab和换行
"set list
"tab用>---表示，空格用-表示
"set listchars=tab:>-,trail:-
"set nolist

"color evening "在/usr/share/vim/vim73/colors/下

"格式设置
set autoindent	"自动缩进
set smartindent "智能缩进
set cin			"C缩进 -- cindent
set ts=4		"硬tab -- tabstop
set sw=4		" 缩进空格数 -- shiftwidth
set softtabstop=4			"软tab
set expandtab				"空格替换tab
set smarttab				"智能tab

set nocompatible            " 关闭 vi 兼容模式
"set autochdir               " 自动切换当前目录为当前文件所在的目录
set tags=tags;				" ctags
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set nowrap                  " 不自动换行
set magic					" 显示括号配对情况

set showmatch				" 显示匹配
set incsearch				" 搜索中匹配

"Paste toggle - when pasting something in, don't indent.
"避免粘贴的时候自动增加缩进
set pastetoggle=<F3>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BufExplorer setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BufExplorer settings
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" winmanager setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" winmanager settings
let g:winManagerWindowLayout='BufExplorer|FileExplorer'
let g:persistentBehaviour=0 "只剩下一个窗口退出Vim
"let g:AutoOpenWinManager=1
let g:defaultExplorer=0
let g:winManagerWidth = 30
nmap fir :FirstExplorerWindow<cr>
nmap bot :BottomExplorerWindow<cr>
nmap wm :WMToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagList setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
let Tlist_GainFocus_On_ToggleOpen=1      "打开taglist，焦点跳转到taglist
"let Tlist_Auto_Open=1                "自动打开taglist
"let Tlist_Inc_Winwidth=30
"let Tlist_Sort_Type='name'             "根据名字排序，默认是根据出现的顺序
nnoremap <silent> <F8> :TlistToggle<CR>


"Tagbar
"let g:tagbar_autoshowtag = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniCppComplete -- depends on ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocp  
filetype plugin on 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SuperTab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType="context"
