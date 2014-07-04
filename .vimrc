" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
" Plugins for snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets' " This one is optional
" End of snipmate plugins
Plugin 'majutsushi/tagbar'
" All plugins must be added before the following line
filetype plugin indent on
syntax on

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Move from tab to tab
map <Leader>[ <esc>:tabprevious<CR> " Go to previous tab
map <Leader>] <esc>:tabnext<CR>     " Go to next tab

" Move between windows
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

map <Leader>w <esc>:w<CR>           " Save file
map <Leader>q <esc>:q<CR>           " Close file

vnoremap <Leader>s :sort<CR>    " Sort selected lines

" Indentation
vnoremap < <gv
vnoremap > >gv

set tabstop=4		" Number of spaces that <Tab> in the file counts for

set shiftwidth=4	" Number of spaces to use for each step of (auto)indent

set softtabstop=4   " Number of spaces that a <Tab> counts for while performing
                    " editing operations, like inserting a <Tab> or using <BS>

set shiftround      " Round indent to multiple of 'shiftwidth'. Applies to '>'
                    " and '<' commands

set expandtab		" Use the apropiate number of spaces to insert a <Tab>.
					" Spaces are used in indents with the '>' and '<' commands
					" and when 'autoindent' is on. To insert a real tab when
					" 'expandtab' is on, use Ctrl+V <Tab>

set smarttab		" When on, a <Tab> in front of a line inserts blanks
					" according to 'shiftwidth'. 'tabstop' is used in other
					" places. A <BS> will delete a 'shiftwidth' worth of space
					" at the start of the line

set showcmd			" Show (partial) command in status line

set number			" Show line numbers

set showmatch		" When a bracket is inserted, briefly jump to the matching
					" one. The jump is only done if the match can be seen on the
					" screen. The time to show the match can be set with
					" 'matchtime'

set hlsearch		" When there is a previous search pattern, highlight all
					" its matches

set incsearch		" While typing a search command, show immediately where the
					" so far typed matches

set ignorecase		" Ignore case in search patterns

set smartcase		" Override the 'ignorecase' option if search pattern
					" contains upper case characters

set backspace=2		" Influences the working of <BS>, <Del>, Ctrl+W and Ctrl+U
					" in Insert mode. This is a list of items, separated by
					" commas. Each item allows a way to backspace over something

set autoindent		" Copy indent from current line when starting a new line
					" (typing <CR> in Insert mode or when the 'o' or 'O'
					" command)

set textwidth=79	" Maximum width of text that is being inserted. A longer
					" line will be broken after white space to get this width

set colorcolumn=+1  " Print color column at position 'textwidth'+1 
highlight ColorColumn ctermbg=233

set formatoptions=c,q,r,t   " This is the sequence of letters which describes
                            " how automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically
                    " q         Allow formatting of comments with 'gq'
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)

vmap Q gq           " Shortcuts to format
nmap Q gqap

set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma

set background=dark " When set to 'dark', Vim will try to use colors that look
                    " good on a dark background. When set to 'light', vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal

set history=700     " Remember last n commands

set undolevels=700  " Remember last n actions so you can undo them

" Disable backups, swaps
set nobackup
set nowritebackup
set noswapfile

set scrolloff=3     " Keep at least 3 lines above/below

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options for powerline plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set noshowmode
set t_Co=256 
let g:Powerline_symbols = 'fancy'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options for Ctrlp plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'   " Change the default mapping and the default
let g:ctrlp_cmd = 'CtrlP'   " command to invoke CtrlP

let g:ctrlp_working_path_mode = 'ra'    " CtrlP will set its local working
                                        " directory according to this variable
                                        "
                                        " c the directory of the current file.
                                        "
                                        " r the nearest ancestor that
                                        "   contains one of these directories 
                                        "   or files: .git, .hg, .svn, .bzr, 
                                        "   _darcs, and your own root markers 
                                        "   defined with the 
                                        "   g:ctrlp_root_markers option.
                                        " 
                                        " a like 'c', but only applies when the
                                        "   current working directory outside 
                                        "   of CtrlP isn't a direct ancestor of
                                        "   the directory of the current file.

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.pyc  " Exclude files or 
                                                    " directories

let g:ctrlp_user_command = 'find %s -type f'    " Specify an external tool to
                                                " use for listing files instead
                                                " of using Vim's globpath().
                                                " Use %s in place of the target
                                                " directory.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CScope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('cscope')
    set cscopetag cscopeverbose

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    cnoreabbrev <expr> csa
        \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs add'  : 'csa')
    cnoreabbrev <expr> csf
        \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find' : 'csf')
    cnoreabbrev <expr> csk
        \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs kill' : 'csk')
    cnoreabbrev <expr> csr
        \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs reset' : 'csr')
    cnoreabbrev <expr> css
        \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs show' : 'css')
    cnoreabbrev <expr> csh
        \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs help' : 'csh')

    command -nargs=0 Cscope cs add cscope.out .t
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_rope_goto_definition_bind = '<Leader>g'
let g:pymode_rope_goto_definition_cmd = 'vnew'
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = 'vnew'
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>l <ESC>:TagbarToggle<cr>
imap <leader>l <ESC>:TagbarToggle<cr>i
