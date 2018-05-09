"vere goes Vundle Stuff as required
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"NERDtree plugin"
Plugin 'scrooloose/nerdtree'
Plugin 'honza/vim-snippets'
Plugin  'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"Put your non-Plugin stuff after this line
"================END OF VUNDLE==================="

"================EDIT AND SOURCE VIMRC===========
let mapleader="~"
nnoremap <leader>ev :sp $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>

"================Plugin Settings=================
"================================================
" DelimitMate settings
" ===============================================
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let loaded_delimitMate = 1
"================================================
" ============snippets===============
" =====================================
set ruler
"set syntax hilighting.
syntax enable

"use custom color sheme
colorscheme dele

" Use system clipboard
set clipboard=unnamedplus

" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildmode=list:full

"set path root to directory where vim was open
set path+=**

" Don't bell and blink
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell
set enc=utf-8           " utf-8 default encoding
set ls=2                " always show status bar
set incsearch           " incremental search
set hlsearch            " highlighted search results
set nu                  " line numbers
set scrolloff=5         " keep some more lines for scope
set showmatch           " show matching brackets/parenthesis
set matchtime=0         " don't blink when matching

" Tab Settings
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4

" Highlight characters past column 80
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp,go highlight Excess ctermbg=DarkGrey guibg=#c12a0f
    autocmd FileType ruby,python,javascript,c,cpp,go  match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,json,c,cpp,go  set nowrap       
augroup END

"=====================================================
" User hotkeys
"=====================================================
" Easier moving of code blocks
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-Z is Undo
noremap <C-z> u
inoremap <C-z> <C-O>u

" CTRL-Y is Redo
noremap <C-y> <C-R>
inoremap <C-y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" CTRL-S is Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Settings for buffers
map <C-q> :bd<CR>         " close current buffer
noremap <C-Right> :bn<CR> " move to next buffer
noremap <C-Left> :bp<CR>  " move to previous buffer

" Easier split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Easier change size for splitted windows
nnoremap <M-[> :vertical resize +5<cr>
nnoremap <M-]> :vertical resize -5<cr>

" Close open window
nnoremap <F4> :close<CR>
" Activate autocomplete at <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" Generate and insert UUID4 into code by <F12> key
nnoremap <F12> :call InsertUUID4()<CR>

" nohls on Enter save me cleaning the screen
nnoremap <silent><cr> :nohlsearch<cr><cr> k

" Python code check on PEP8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

"NERDtree remap
nmap <leader>d :NERDTreeToggle <CR>
"======================================
" Insert mode remap
"======================================
" func EatSpaceChar(pat)
"       let c = nr2char(getchar(0))
"       return (c =~ a:pat) ? '' : c
" endfunc
" "   iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>
" autocmd FileType python :iabbrev prt  print("")<esc>hi<C-R>=EatSpaceChar('\s')
inoremap jk <esc>
inoremap <leader>9 ()<esc>i
inoremap <leader>[ []<esc>i
""inoremap <leader>[ []<esc>i
inoremap <leader>'' ""<esc>i
inoremap <leader>' ''<esc>i
" Java iabbrevs"
autocmd FileType java :iabbrev prt System.out.println("");<esc>2hi
autocmd FileType java :iabbr psvm public static void main(String[] args){<CR>}<esc>O
autocmd FileType java :iabbr sop System.out.println("");<esc>2hi
autocmd FileType java :iabbr syserr System.err.println("");<esc>2hi
autocmd FileType java :iabbr sep System.err.println("");<esc>2hi

abbr forl for (int i = 0; i < ; i++) {<esc>7hi
abbr tryb try {<CR>} catch (Exception ex) {<CR> ex.printStackTrace();<CR>}<esc>hx3ko
autocmd FileType java :iabbr const public static final

abbr ctm System.currentTimeMillis();<CR>
abbr slept try {<CR> Thread.sleep();<CR>}<esc>hxA catch(Exception ex) {<CR> ex.printStackTrace();<CR>}<esc>hx3k$hi

"=================================Java settings========================
"Settings specific for java language
"=====================================================================
autocmd FileType java set tags=~/.vim/tags/java/tags
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo 
"set tags=./tags

"=================Golang==========================
"autocmd to run goimports on each saving of go file.
autocmd FileType go :iabbr fori for i := 0; i < ; i++ {<CR><CR>}<esc>3k7wi
autocmd BufWritePost *.go !gofmt -w %
"==============end of Golang======================
