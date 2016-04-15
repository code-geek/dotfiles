" vim:set foldmethod=marker foldlevel=0:

"==============================================================================
" General vim settings
"==============================================================================

" {{{
let mapleader=','
let maplocalleader=','

" Set encoding at startup
if has('vim_starting')
    set encoding=utf-8
endif

set autoindent                 " Auto indent
set autoread                   " Auto read file when modified externally
set backspace=indent,eol,start " Backspace through everything
set colorcolumn=120            " Ruler for maximum characters
set complete-=i                " Don't search included files
set cursorline                 " Highlight current line
set display+=lastline          " Display as much as possible content of last line
set expandtab                  " Tabs are spaces
set foldenable                 " Enable folding
set foldlevelstart=10          " Open most folds by default
set foldmethod=indent          " Fold based on indent level
set foldnestmax=10             " 10 nested fold max
set formatoptions="tcqj"       " Settings for automatic formatting
set hidden                     " Enables hidden buffer
set history=1000               " Max history to remember
set hlsearch                   " Turn on search pattern highlighting
set ignorecase                 " Case insensitive search
set incsearch                  " Search as characters are entered
set laststatus=2               " Always show status line
set lazyredraw                 " Redraw only when we need to
set list                       " Show invisible characters
set noswapfile                 " Disable swap file
set nowrap                     " Disable wrapping
set number                     " Shows line number
set sessionoptions-=options    " Don't store options in sessions
set shiftround                 " Round indent to multiple of 'shiftwidth'
set shiftwidth=4               " Number of space insert/remove shifting line
set shortmess=I                " Hide intro message
set smartcase                  " Performs case sensitive search if contains uppercase letters
set smartindent                " Smart indentation
set softtabstop=4              " Number of spaces in tab when editing
set splitright                 " New windows goes right
set t_Co=256                   " Set terminal color to 256
set tabpagemax=50              " Maximux number of tab pages to be opened from command
set tabstop=4                  " Number of visual spaces per TAB
set title                      " Change terminal title
set ttyfast                    " Optimize for fast terminal connections
set undofile                   " Persistent undo
set undolevels=1000            " How many undos
set undoreload=10000           " Number of lines to save for undo
set wildmenu                   " Visual autocomplete for command menu
set modelines=1                " Enable modelines
set modeline                   " Enable modelines
syntax on


if !empty(&viminfo)
  set viminfo^=!
endif

filetype plugin indent on
" }}}

"==============================================================================
" Plugin list
"==============================================================================

" {{{
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'nvie/vim-flake8'
Plug 'othree/html5.vim'
Plug 'tmhedberg/matchit'

Plug 'Yggdroot/indentLine' "shows thin vertical lines at each indentation level
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' "now plugins can tap into the . command
Plug 'tpope/vim-obsession' "saner mksession settings
Plug 'majutsushi/tagbar' "shows the tags in a file in the sidebar
Plug 'wellle/targets.vim' "more targets like da,
Plug 'tomtom/tcomment_vim' "comments for vim
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo' "view contents of registers
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'justinmk/vim-gtfo' "Opens the file manager or terminal at the directory of the current file in Vim.

Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'

Plug 'zchee/deoplete-jedi'
Plug 'freitass/todo.txt-vim'

call plug#end()
" }}}

"==============================================================================
" Colorscheme
"==============================================================================

" {{{
set background=dark

let g:gruvbox_invert_selection=0

colorscheme gruvbox

function! ToggleBackground()
    if &background=="dark"
        set background=light
    else
        set background=dark
    endif
endfunction

nnoremap <F5> :call ToggleBackground()<CR>

if has('nvim')
    " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
" }}}

"==============================================================================
" Mappings
"==============================================================================

" {{{
if has('nvim')
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l

    tnoremap <C-q> <C-\><C-n>
endif

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Move line
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
xnoremap <C-j> :m '>+1<CR>gv=gv
xnoremap <C-k> :m '<-2<CR>gv=gv
xnoremap <C-h> <gv
xnoremap <C-l> >gv
nnoremap <C-h> <<
nnoremap <C-l> >>
xnoremap < <gv
xnoremap > >gv

" Highlight last inserted text
nnoremap gV `[v`]

" Mapping to switch buffers
nnoremap gn :bnext<CR>
nnoremap gp :bprevious<CR>

" Force saving files requiring root permission
cnoremap w!! w !sudo tee > /dev/null %

nnoremap <Leader>q :bd<CR>
nnoremap <Leader>n :enew<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ez :edit ~/dotfiles/zshrc<CR>

" space open/closes folds
nnoremap <space> za

"move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

"turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Save
inoremap <C-s><C-O> :update<CR>
nnoremap <C-s> :update<CR>
nnoremap <leader>s :update<CR>
nnoremap <leader>w :update<CR>

" Yank text to the clipboard
nnoremap <leader>y "+y
nnoremap <leader>yy "+Y

" Preserve indentation while pasting text from the clipboard
nnoremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" insert new line without going to insert mode
nmap oo o<Esc>k
nmap OO O<Esc>j
" }}}

"==============================================================================
" Easymotion
"==============================================================================

" {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" }}}

"==============================================================================
" Synstastic
"==============================================================================

" {{{
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501,E225'
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✠"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "≈"
" }}}

"==============================================================================
" Airline
"==============================================================================

" {{{
let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" Show buffer list at top
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1

nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9
" }}}


"==============================================================================
" Flake8
"==============================================================================

" {{{
let g:flake8_show_in_gutter=1
" }}}

"==============================================================================
" FZF
"==============================================================================

" {{{
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Fzf layout
let g:fzf_layout = { 'down': '40%' }

" Mapping
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>

" Advanced customization using autoload functions
autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})
" }}}

"==============================================================================
" undotree
"==============================================================================

" {{{
nmap <F3> :UndotreeToggle<CR>
" }}}

"==============================================================================
" Tagbar
"==============================================================================

" {{{
nmap <F10> :TagbarToggle<CR>
" }}}

"==============================================================================
" vim-snippet
"==============================================================================

" {{{
" let g:UltiSnipsUsePythonVersion = 2

let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
" }}}

"==============================================================================
" vim-easy-align
"==============================================================================

" {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

"==============================================================================\
" deoplete
"==============================================================================

" {{{
" Enable completion
let g:deoplete#enable_at_startup = 1

" Disable pydoc split
autocmd FileType python set completeopt-=preview
" }}}

"==============================================================================
" Indentline
"==============================================================================

" {{{
let g:indentLine_char = '┆'
" }}}

"==============================================================================
" Vim Session
"==============================================================================

" {{{
nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
" }}}

"==============================================================================
" Custom Functions
"==============================================================================

" {{{
"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

" relative django file editing
let g:last_relative_dir = ''
nnoremap \1 :call RelatedFile ("models.py")<cr>
nnoremap \2 :call RelatedFile ("views.py")<cr>
nnoremap \3 :call RelatedFile ("urls.py")<cr>
nnoremap \4 :call RelatedFile ("admin.py")<cr>
nnoremap \5 :call RelatedFile ("tests.py")<cr>
nnoremap \6 :call RelatedFile ( "templates/" )<cr>
nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
nnoremap \8 :call RelatedFile ( "management/" )<cr>
nnoremap \0 :e settings.py<cr>
nnoremap \9 :e urls.py<cr>

fun! RelatedFile(file)
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun! SetDjangoAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
autocmd BufEnter *.py call SetDjangoAppDir()
" }}}
