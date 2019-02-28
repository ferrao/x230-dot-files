set nocompatible
filetype off

call plug#begin()

" sensible vim defaults
Plug 'tpope/vim-sensible'

" theming
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'mhartington/oceanic-next'
Plug 'cocopon/iceberg.vim'
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'

" syntax highlights 
Plug 'othree/html5.vim'
Plug 'JulesWang/css.vim'
Plug 'pangloss/vim-javascript'
"Plug 'othree/yajs.vim' " alternative js syntax plugin, not working well for me
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'othree/jsdoc-syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'Valloric/MatchTagAlways'
Plug 'lilydjwg/colorizer'

" code formatting and auto-completion
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }

" file browser
Plug 'scrooloose/nerdtree'

" terminal
Plug 'kassio/neoterm'

" search/fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()

" tab as 4 spaces or die
set autoindent
set tabstop=4 " 4 spaces as soft tab
set shiftwidth=4 " number of spaces to use for autoindent
set shiftround " round indent to multiples of shiftwidth
set expandtab " insert tab with the right amount of spacing
set wrap
set textwidth=120
set formatoptions=qrn1
set colorcolumn=80 " visual indicator of 80 column

" usefull stuff 
filetype plugin on
set nocompatible " all in on vim
set ttyfast " should make scrolling faster
set lazyredraw " should make scrolling faster
set mouse=a " we can actually resize, select and copy with the mouse
set clipboard=unnamed " required for integration with osx clipboard
set number  " show line numbers 
set numberwidth=1  " show line numbers 
set showcmd " show incomplete commands 
set laststatus=2 " always display the status line
set autowrite " write before running commands
set ignorecase " ignore case when searching
set smartcase " but use case sensitive if a capital letter is present
set noshowmode " no need to show mode, airline takes care of that
set scrolloff=3 " display some extra lines at the bottom
set hidden " enable hidden unsaved buffers, required for LSP rename
set wildmenu " enable wildmenu
set wildmode=list:longest,list:full " configure wildmenu 
set visualbell " visual bell for errors
set cursorline " highlight the line where the cursor is
set cursorcolumn " highlight the column where the cursor is
set ruler
set backspace=indent,eol,start
set relativenumber " makes file navigation so easy...
set undofile
set autoread

" set gf file paths
set path=.,src,lib,node_nodules
set suffixesadd=.js,.jsx

" swap file and undo/backup files
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

" terminal
set termguicolors " enable true colors
let $GIT_EDITOR = 'nvr -cc split --remote-wait'
let $EDITOR = 'nvr -l' " prevent nested vim editors inside the temrinal
tnoremap <silent> <leader><esc> <C-\><C-n><esc><CR> 
nnoremap <silent> <leader>t :vertical botright Ttoggle<CR><C-w>l

" theme
syntax enable " enable syntax highlight
set background=dark " default background is dark
colorscheme iceberg " default theme 
let g:airline_theme='iceberg' " default airline theme
hi Comment gui=italic cterm=italic term=italic
let g:colorizer_maxlines = 1000 " does not work well with large files
let g:javascript_plugin_jsdoc = 1

" change theme to Light
function! PresentationMode()
    colorscheme Atelier_SavannaLight
    set background=light
endfunction
" change theme to default dark mode 
function! NormalMode()
    set background=dark
    colorscheme iceberg
endfunction
nmap <leader>PR :call PresentationMode()<CR>
nmap <leader>PP :call NormalMode()<CR>

" jsx
"" For strict usage in jsx files 
"let g:jsx_ext_required = 1
"let g:mta_filetypes = { 'javascript.jsx' : 1 }
"" More JSX relaxed settings
let g:jsx_ext_required = 0
let g:mta_filetypes = { 'javascript.jsx' : 1, 'javascript': 1 }

" emmet-vim
let g:user_emmet_leader_key='<C-e>' " leader + comma(,) expands emmet
let g:user_emmet_settings = { 'javascript.jsx' : { 'extends' : 'jsx' } }

" linter
let g:ale_linters = {'javascript': ['eslint'], 'javascript.jsx': ['eslint'], 'json': ['eslint'] }
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" formatter
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \  'javascript': ['prettier', 'eslint'],
      \  'jsx': ['prettier', 'eslint'],
      \  'flow': ['prettier'],
      \  'typescript': ['prettier'],
      \  'css': ['prettier'],
      \  'less': ['prettier'],
      \  'scss': ['prettier'],
      \  'json': ['prettier'],
      \  'graphql': ['prettier'],
      \  'markdown': ['prettier'],
             \ }
let g:ale_javascript_prettier_options = '--print-width 100 --tab-width 4 --single-quote'

" file browser
"nnoremap <silent> <Leader><Space> :NERDTreeToggle<Enter>
nnoremap <silent><expr> <Leader><Space> g:NERDTree.IsOpen() ? ":NERDTreeClose\<CR>" : ":NERDTree\<CR>"

nnoremap <silent> <Leader>f :NERDTreeFind<Enter>
let NERDTreeQuitOnOpen=0 " leave NERDTree open after opening file
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
autocmd FileType nerdtree setlocal signcolumn=no
autocmd VimLeave * NERDTreeClose

" code folding
let javascript_fold=1
set foldmethod=indent
set foldlevelstart=20
let g:markdown_fenced_languages = ['html', 'js=javascript', 'json', 'bash=sh']

" auto completion with deoplete and LSP
let g:deoplete#enable_at_startup = 1 " turn on deoplete

"use tab and shift-tab to scroll through suggestions, esc to close popup
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" 
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use language server
let g:LanguageClient_autoStart = 1  " Automatically start language servers
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_changeThrottle = 0.5 " Delay before sending text changes to server
let g:LanguageClient_trace = 'verbose'
let g:LanguageClient_loadSettings=expand('~./.vim/settings.json')
let g:LanguageClient_loggingFile = expand('~/.vim/LanguageClient.log') 
let g:LanguageClient_serverStderr = expand('~/.vim/LanguageServer.log')
let g:LanguageClient_loggingLevel = 'WARN' " DEBUG|INFO||WARN|ERROR
let g:LanguageClient_waitOutputTimeout = 3 " timeout if server does not respond in 3s 
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio', '-l', '~/.vim/lsp.log'],
    \ 'javascript.jsx': ['javascript-typescript-stdio', '-l', '~/.vim/lsp.log']
    \ }

autocmd FileType javascript setlocal completefunc=LanguageClient#complete
nnoremap <silent> <leader>m :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>fr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>s :call LanguageClient_textDocument_documentSymbol()<CR>

" multiple windows
set splitbelow " used by split command
set splitright " used by vsplit command 

" Faster move between windows using alt-dir keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Sane and fast window resize using alt-[+-<>], alt-_ is a common mistake :)
nnoremap <m-lt> :exe "vertical resize " . (winwidth(0) * 3/4)<CR>
nnoremap <m->> :exe "vertical resize " . (winwidth(0) * 4/3)<CR>
nnoremap <m-+> :exe "resize " . (winheight(0) * 4/3)<CR>
nnoremap <m--> :exe "resize " . (winheight(0) * 3/4)<CR>
nnoremap <m-_> :exe "resize " . (winheight(0) * 3/4)<CR>

" Search/Finders
"" clear search highlight on esc
nnoremap <silent> <esc> :noh<return><esc> 
let $FZF_DEFAULT_COMMAND = 'ag --ignore-case --depth -1 -g ""'
let g:fzf_layout = { 'window': '10split enew' }
"" makes fzf look like ctrlp replacement
nnoremap <C-p> :Files<CR> 
"" avoid common mistake of opening fzf when saving file
cnoremap W<CR> w<CR>

 
"" shortcut for fzf but preventing new file to open inside nerd tree buffer
nnoremap <expr> <C-s> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Ag<space>"
let g:fzf_action = {
    \ '': 'vsplit', 
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

"
" Start screen
let g:startify_session_autoload = 1
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_dir = '~/.vim/session'
let g:startify_list_order = [
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Last recently opened files'],
      \ 'files',
      \ ['   Last recently modified files in the current directory:'],
      \ 'dir',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ]

" Highlight keywords in comments like TODO, FIXME, WARNING, NOTE
autocmd VimEnter * :silent! call matchadd('Todo', 'TODO\|FIXME\|WARNING\|NOTE\|Plugin:', -1)
