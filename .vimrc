" Fold shortcuts
" za - toggle minimize/open selected fold
" z + R - open all fold
" z + M - minimize all folds

" Standard vimrc stuff {{{
set nocompatible              " be improved, required
filetype off                  " required
" }}}

" Root Ignore {{{
let g:RootIgnoreUseHome = 1
let g:RootIgnoreAgignore = 1
" }}}

" Runtime path {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ag
set runtimepath^=~/.vim/bundle/ctrlp.vim
" }}}

" Vundle Plugins {{{
call vundle#begin()
Plugin 'gmarik/Vundle.vim'                          " let Vundle manage Vundle, required
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'bling/vim-airline'                          " Status bar customization
Plugin 'ctrlpvim/ctrlp.vim'                         " Fuzzy search plugin
Plugin 'rking/ag.vim'                               " Silver searcher fast search utility
Plugin 'https://github.com/scrooloose/nerdtree.git' " NERDTree file explorer plugin
Plugin 'DavidEGx/ctrlp-smarttabs'                   " Smart Tabs
Plugin 'godlygeek/tabular'                          " Tabular
Plugin 'easymotion/vim-easymotion'                  " Easy cursor navigation with few clicks
Plugin 'xolox/vim-misc'                             " Needed for easytags
Plugin 'jlanzarotta/bufexplorer'                    " Explorer for file buffers
Plugin 'terryma/vim-multiple-cursors'               " Multiple cursor in vim
"Plugin 'scrooloose/nerdcommenter'                   " Awesome commenting plugin
Plugin 'tomtom/tcomment_vim'                            " Simple commenter preferred over nerdcommenter
Plugin 'Townk/vim-autoclose'                        " Automatically close braces, parantheses, etc
"Plugin 'xolox/vim-easytags'                         " Easy Tags for automatic ctag
Plugin 'tpope/vim-surround'                         " Easily change surrounding paraentheses, quotes, etc
Plugin 'airblade/vim-gitgutter'                     " Show git changes in vim on the left sidebar
Plugin 'dhruvasagar/vim-table-mode'                 " markdown file editor to automatically insert |
Plugin 'xolox/vim-lua-ftplugin'                     " Lua plugin for vim
Plugin 'dracula/vim'                                " Dracula colorscheme
Plugin 'Rip-Rip/clang_complete'                     " Clang autocomplet for C-code
"Plugin 'octref/RootIgnore'  " Ctrl-P ignore files in .gitignore
"Plugin 'thoughtbot/vim-rspec' "Rspec for VIM, https://robots.thoughtbot.com/running-specs-from-vim
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Clang Complete {{{
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1
let g:clang_use_library = 1
let g:clang_library_path='/home/jhongpananon/llvm/build/lib/libclang.so'
" }}}

" C settings {{{
set colorcolumn=120
highlight ColorColumn ctermbg=darkgray
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
"let &path.="/src/controls,/src/controls/behavioral,/src/controls/behavioral,/src/dlog,/src/drlog,/src/power_io,/src/uds"
" }}}

" Cscope dynamic {{{
let g:cscopedb_auto_init=1
" }}}

" TMux Settings {{{
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" Code Settings {{{
" Don't highlight ugly code
match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'
" }}}

" Global Shortcuts {{{
let mapleader = "," " Remap leader key
set timeoutlen=2000 "timeout length for leader key
" Set it so that you only have to press ;w to save instead of shift+;w
nnoremap ; : 

" cycle through buffers with TAB or SHIFT-TAB
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" open buffer explorer
nnoremap <leader>g :ls<CR>:b<Space>

"opens .vimrc in new tab
nmap <leader>v :tabedit $MYVIMRC<CR>
" }}}

" NERDTree {{{
" opens NERDTree w/ Ctrl+n
map <C-e> :NERDTreeToggle<CR>

" opens NERDTree automatically  when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }}}

" Multiple Cursor {{{
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-y>'
let g:multi_cursor_prev_key='<C-u>'
let g:multi_cursor_skip_key='<C-i>'
let g:multi_cursor_quit_key='<Esc>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>
" }}}

" SmartTabs {{{
let g:ctrlp_extensions = ['smarttabs']

" If 1 will highlight the selected file in the tabline.
" " (Default: 1)
let g:ctrlp_smarttabs_modify_tabline = 0

" Open Ctrl-P find in a new tab
map <leader>t :CtrlPSmartTabs<CR>
" }}}

" Silver Searcher {{{
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  let g:ctrlp_switch_buffer = 0

  let g:ctrlp_match_window = 'bottom,order:ttb'

  let g:ctrlp_working_path_mode = 0
endif

"Open new tab and search for something
nmap <leader>a :tab split<CR>:Ag ""<Left>

"Immediately search for the word under the cursor in a new tab
nmap <leader>A :tab split<CR>:Ag <C-r><C-w><CR>   
" }}}

" Many configs {{{
set gdefault                          " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent                        " auto indenting
set number                            " line numbers
set relativenumber                    " shows relative line numbers
set nobackup                          " get rid of anoying ~file
set nocompatible
set clipboard=unnamed                 " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu                          " Enhance command-line completion
set esckeys                           " Allow cursor keys in insert mode
set backspace=indent,eol,start        " Allow backspace in insert mode
set ttyfast                           " Optimize for fast terminal connections
set gdefault                          " Add the g flag to search/replace by default
set encoding=utf-8 nobomb             " Use UTF-8 without BOM
set binary                            " Don’t add empty newlines at the end of files
set noeol
set backupdir=~/.vim/backups          " Centralize backups, swapfiles and undo history
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif
set history=700                       " Sets how many lines of history VIM has to remember
set autoread                          " Set to auto read when a file is changed from the outside
set so=40                             " Set 10 lines to the cursor - when moving vertically using j/k
set splitright                        " New splits always to right or below active window
set splitbelow
set wildmenu                          " Turn on the WiLd menu
set wildignore=*.o,*~,*.pyc           " Ignore compiled files
set ruler                             " Always show current position
set cmdheight=1                       " Height of the command bar
set hid                               " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent        " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase                        " Ignore case when searching
set smartcase                         " When searching try to be smart about cases
set hlsearch                          " Highlight search results
set incsearch                         " Makes search act like search in modern browsers
set lazyredraw                        " Don't redraw while executing macros (good performance config)
set magic                             " For regular expressions turn magic on
set showmatch                         " Show matching brackets when text indicator is over them
set mat=2                             " How many tenths of a second to blink when matching brackets
set noerrorbells                      " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500
set nowrap
set nobackup                          " => Files, backups and undo
set nowb
set noswapfile
set expandtab
set copyindent
set preserveindent
set softtabstop=0
set smarttab                          " Be smart when using tabs ;)
set shiftwidth=4                      " 1 tab == 4 spaces
set tabstop=2

set ai                                " Auto indent
set si                                " Smart indent
map j gj
map k gk

try                                   " Specify the behavior when switching between buffers
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" show all characters that aren't whitespace by using :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Line joining usefulness
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

" Get to NORMAL mode with 'jj'
inoremap jj <Esc>

" shortcut to save
nmap <Leader>. :w<cr> 
" }}}

" Colors/Fonts {{{
syntax enable
set background=dark
set t_Co=256
"colorscheme dracula
colorscheme material-monokai

hi clear CursorLineNR "clears highlighting of cursor line number
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac " Use Unix as the standard file type
" }}}

" Buffer {{{
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
" }}}

" Status Line {{{
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ Col:\ %c
" }}}

" Paste Options {{{
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

" F2 to set paste mode so vim doesn't mess up the indentation
" Remember to press F2 once done
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" }}}

" Tabularize {{{
nmap <Leader>b :Tabularize /
vmap <Leader>b :Tabularize /
nmap <Leader>b: :Tabularize /:\zs<CR>
vmap <Leader>b: :Tabularize /:\zs<CR>

" Don't remember what this is
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Attempt to auto-tabularize pipes when in insert mode
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if (getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p))
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
" }}}

" Misc. Keyboard Shortcuts {{{
" Redefines Enter and Backspace to paragraph mode
nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {

nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }
" }}}

" Easy Motion {{{
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"let g:easytags_on_cursorhold = 0
"let b:easytags_auto_highlight = 0 " Disable automatic highlighting
"let g:easytags_async = 1
"let g:easytags_auto_update = 0
"let g:easytags_autorecurse = 1
"let g:easytags_include_members = 1
" }}}

" NERDCommenter {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '\n*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" }}}

" Cscope maps {{{
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>  


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>  

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR> 
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR> 


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR> 
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif
" }}}

" Table-mode {{{
let g:table_mode_corner="|"
" }}}

" Fold Settings {{{
set modeline
" vim:foldmethod=marker:foldlevel=0
" }}}
