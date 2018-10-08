"here goes Vundle Stuff as required
" map leader
let mapleader="~"
set nocompatible              " be iMproved, required
filetype off                  " required
let isNpmInstalled = executable("npm")
" Show message that npm is required {{{
if isNpmInstalled ==# 0
    echo "==============================================="
    echo "=           INSTALL NPM !!!!                  ="
    echo "==============================================="
    echo ""
endif
" }}}
" default path for node_modules
let s:defaultNodeModules = '~/.vim/node_modules/.bin/'
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" Vundle managed Plugins {{{
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"NERDtree plugin"
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neosnippet'
if !has('nvim')
	Plugin 'roxma/nvim-yarp'
	Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'honza/vim-snippets'
Plugin  'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
" HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim.
Plugin 'othree/html5.vim'
" Improve javascritp syntax higlighting, needed for good folding,
" and good-looking javascritp code
Plugin 'jelera/vim-javascript-syntax'
" Improved json syntax highlighting
Plugin 'elzr/vim-json'
" Syntax highlighting for .jsx (js files for react js)
Plugin 'mxw/vim-jsx'
" Add Support css3 property
Plugin 'hail2u/vim-css3-syntax'
" Syntax highlighting for Stylus
Plugin 'wavded/vim-stylus'
" Add support for taltoad/vim-jadeumarkdown
Plugin 'tpope/vim-markdown'
" Highlights the matching HTML tag when the cursor
" is positioned on a tag.
Plugin 'gregsexton/MatchTag'
" Automatically add closing tags in html-like formats
Plugin 'alvan/vim-closetag'
" Smart indent for javascript
" http://www.vim.org/scripts/script.php?script_id=3081
Plugin 'lukaszb/vim-web-indent'
" Some support functions used by delimitmate, and snipmate
Plugin 'vim-scripts/tlib'
"code-completion for jquery, lodash e.t.c
Plugin 'othree/javascript-libraries-syntax.vim'
" Code complete
Plugin 'Shougo/neocomplcache.vim'
"add typescript support
Plugin 'leafgarland/typescript-vim'

" !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
" All of your Plugins must be added before the following line
"
" }}}
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief Vundle help {{{
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins;
" :PluginInstall! to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins;
" :PluginClean! to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" }}}

"================Plugin Settings=================
" delimitMate settings {{{
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let loaded_delimitMate = 1
" }}}
" neosnippets settings {{{
" Enable snipMate compatibility
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" Disables standart snippets. We use vim-snippets bundle instead
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
" key mapings
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" not working properly
" imap <expr><TAB> pumvisible() ? "\<C-n>" :
"             \ neosnippet#expandable_or_jumpable() ?
"             \ <Plug>(neosnippet_expand_or_jump) : "\<TAB>"
" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif
" }}}
" neocomplcash settings {{{
" Enable NeocomplCache at startup
let g:neocomplcache_enable_at_startup = 1

" Max items in code-complete
let g:neocomplcache_max_list = 10

" Max width of code-complete window
let g:neocomplcache_max_keyword_width = 80

" Code complete is ignoring case until no Uppercase letter is in input
let g:neocomplcache_enable_smart_case = 1

" Auto select first item in code-complete
let g:neocomplcache_enable_auto_select = 1

" Disable auto popup
let g:neocomplcache_disable_auto_complete = 1
" Smart tab Behavior
" function! CleverTab()
"     " If autocomplete window visible then select next item in there
"     if pumvisible()
"         return "\<C-n>"
"     endif
"     " If it's begining of the string then return just tab pressed
"     let substr = strpart(getline('.'), 0, col('.') - 1)
"     let substr = matchstr(substr, '[^ \t]*$')
"     if strlen(substr) == 0
"         " nothing to match on empty string
"         return "\<Tab>"
"     else
"         " If not begining of the string, and autocomplete popup is not visible
"         " Open this popup
"         return "\<C-x>\<C-u>"
"     endif
" endfunction
" inoremap <expr><TAB> CleverTab()

" Undo autocomplete
inoremap <expr><C-e> neocomplcache#undo_completion()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" For cursor moving in insert mode
" inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
" inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
" inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
" inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

" disable preview in code complete
set completeopt-=preview
" }}}
" vim-closeta {{{
" Enable for files with this extensions
let g:closetag_filenames = "*.handlebars,*.html,*.xhtml,*.phtml"
" }}}
" syntastic {{{
" Install jshint and csslint for syntastic
" Path to jshint if it not installed, then use local installation
" TODO change to node_modules that used in system and make syntastic
" use eslint jhint make it pain! do not like it at all! find how to use
" syntastic with vue. Do make absolute minimum installation list of npm
" modules that are required to lint, check whatever needed for correct
" workflow with vim. ESLint, csslint, vue-eslint. React/Redux may require
" some linting as well. Make function to find where are global npm is about 
" to be installed.
"
if isNpmInstalled
    if !executable(expand(s:defaultNodeModules . 'jshint'))
        silent ! echo 'Installing jshint' && npm --prefix ~/.vim/ install jshint
    endif
    if !executable(expand(s:defaultNodeModules . 'csslint'))
        silent ! echo 'Installing csslint' && npm --prefix ~/.vim/ install csslint
    endif
    if !executable(expand(s:defaultNodeModules . 'tslint'))
        silent ! echo 'Installing tslint' && npm --prefix ~/.vim/ install tslint
    endif
endif

function! s:FindSyntasticExecPath(toolName)
    if executable(a:toolName)
        return a:toolName
    endif

    let fullPath=fnamemodify('.', ':p:h')
    while fullPath != fnamemodify('/', ':p:h')
        if filereadable(expand(fullPath . '/node_modules/.bin/' . a:toolName))
            return fullPath . '/node_modules/.bin/' . a:toolName
        endif
        let fullPath = fnamemodify(fullPath . '/../', ':p:h')
    endwhile

    return  s:defaultNodeModules . a:toolName

endfunction


" setting up jshint csslint and jscs if available
" disable jshint
" let g:syntastic_javascript_jshint_exec = s:FindSyntasticExecPath('jshint')
let g:syntastic_javascript_eslint_exec = s:FindSyntasticExecPath('eslint')
let g:syntastic_javascript_jscs_exec = s:FindSyntasticExecPath('jscs')
let g:syntastic_css_csslint_exec= s:FindSyntasticExecPath('csslint')
let g:syntastic_typescript_tslint_exec = s:FindSyntasticExecPath('tslint')

" Enable autochecks
let g:syntastic_check_on_wq=1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" For correct works of next/previous error navigation
let g:syntastic_always_populate_loc_list = 1

" check json files with jshint
let g:syntastic_filetype_map = { "json": "javascript", }
" use eslint instead of jshint
let g:syntastic_javascript_checkers = ["eslint", "jscs"] 
" let g:syntastic_javascript_checkers = ["jshint", "jscs"] 
" open quicfix window with all error found
nmap <silent> <leader>ll :Errors<cr>
" previous syntastic error
nmap <silent> [ :lprev<cr>
" next syntastic error
nmap <silent> ] :lnext<cr>
" }}}

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


" Highlight characters past column 80
" TODO fix FileTypes see what else I use.
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp,go,ts
    \ highlight Excess ctermbg=DarkGrey guibg=#c12a0f
    autocmd FileType ruby,python,javascript,c,cpp,go,ts
    \ match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,json,c,cpp,go,ts  set nowrap       
augroup END

" User hotkeys {{{
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
nnoremap ==  5<C-W>+ " double = add 5 rows
nnoremap -- 5<C-W>- " double - shrink window by 5 lines
nnoremap << 5<C-W>< " shrink splitted window to the left by 5
nnoremap >> 5<C-W>> " add splitted window

" Close open window
nnoremap <F4> :close<CR>
" Activate autocomplete at <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" Generate and insert UUID4 into code by <F12> key
nnoremap <F12> :call InsertUUID4()<CR>

" nohls on Enter save me cleaning the screen
nnoremap <silent><cr> :nohlsearch<cr><cr> k
" }}}

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
" javascript & typescript iabbrevs
autocmd FileType javascript, typescript :iabbrev log console.log('');<esc>2hi
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

"=================Golang==========================
"autocmd to run goimports on each saving of go file.
autocmd FileType go :iabbr fori for i := 0; i < ; i++ {<CR><CR>}<esc>3k7wi
autocmd BufWritePost *.go !gofmt -w %
"==============end of Golang======================
" ===============GENERAL SETTINGS=================
" {{{
set ruler
"set syntax hilighting.
syntax enable

"use custom color sheme to start must first
" clone repesitory https://github.com/rafi/awesome-vim-colorschemes.git
" cp -r colors ~/.vim
  colorscheme apprentice

" Use system clipboard
set clipboard=unnamedplus
" disable annoying prompt on initial bundle install
set nomore
" Set character encoding to use in vim
set encoding=utf-8

" Let vim know what encoding we use in our terminal
set termencoding=utf-8
" ===============tab options=====================

" Copy indent from previous line
set autoindent

" Enable smart indent. it add additional indents whe necessary
set smartindent

" Add cindent
set cindent

" Replace tabs with spaces
set expandtab

" Whe you hit tab at start of line, indent added according to
" shiftwidth value
set smarttab

" number of spaces to use for each step of indent
set shiftwidth=2

" Number of spaces that a Tab in the file counts for
set tabstop=2

" Same but for editing operation (not shure what exactly does it means)
" but in most cases tabstop and softtabstop better be the same
set softtabstop=2

" Round indent to multiple of 'shiftwidth'.
" Indentation always be multiple of shiftwidth
" Applies to  < and > command
set shiftround
" end tab options================================
" ===============wildmenu========================
" Extended autocmpletion for commands
set wildmenu

" Autocmpletion hotkey
set wildcharm=<TAB>

" Go to Defenition ctags tags
set tags=./tags,tags;
"--------------------------------------------------
" Folding

" Enable syntax folding in javascript
let javaScript_fold=1

" No fold closed at open file
set foldlevelstart=99
set nofoldenable

" Keymap to toggle folds with space
nmap <space> za
" ==========no swap no backup============
" Disable backups file
set nobackup

" Disable vim common sequense for saving.
" By defalut vim write buffer to a new file, then delete original file
" then rename the new file.
set nowritebackup

" Disable swp files
set noswapfile

" Do not add eol at the end of file.
set noeol
" =================auto close of preview and foldings==========
        " Auto close preview window, it uses with tags,
        " I don't use it
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif

        " Disable vertical line at max string length in NERDTree
        autocmd FileType * setlocal colorcolumn=+1
        autocmd FileType nerdtree setlocal colorcolumn=""

        " Not enable Folding - it really slow on large files, uses plugin vim-javascript-syntax
        " au FileType javascript* call JavaScriptFold()
        au FileType html let b:loaded_delimitMate = 1
        au FileType handlebars let b:loaded_delimitMate = 1

" }}}

" edit and source vimrc {{{
nnoremap <leader>ev :sp $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>
" }}}

" set fold method for vim files and close them all {{{
augroup filetype_vim
    au!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim execute "normal! zM"
augroup END
" }}}
