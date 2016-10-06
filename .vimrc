" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" Add plugins below this line
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'   " Git wrapper. Recommended with airline
Plugin 'kien/ctrlp.vim'       " File browser
Plugin 'klen/python-mode'     " For Python development
"Plugin 'scrooloose/syntastic' " Syntax analyzer
Plugin 'scrooloose/nerdtree'  " File browser
" Plugins for snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets' " This one is optional
" End of snipmate plugins
Plugin 'SirVer/ultisnips'
Plugin 'Rip-Rip/clang_complete'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
" Support for perl
Plugin 'vim-perl/vim-perl'
" GDB inside vim
" Plugin 'vim-scripts/Conque-GDB'
" Add plugins above this line
filetype plugin indent on
syntax on

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Auto trim files on saving
autocmd FileType c,cpp,python autocmd BufWritePre <buffer> :%s/\s\+$//e

" Hide buffers instead of closing them when closing the window they are in
:set hidden

" Remap leader key
let mapleader=","

" Tabs navigation
" ===============
" Go to previous tab
map <Leader>[ <esc>:tabprevious<CR>
" Go to next tab
map <Leader>] <esc>:tabnext<CR>

" Windows navigation
" ==================
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Save file
map <Leader>w <esc>:w<CR>
" Close file
map <Leader>q <esc>:q<CR>

" Sort selected lines
vnoremap <Leader>s :sort<CR>

" Indentation
" ===========
" Indent 1 level to the <<left<< selected code in visual mode
vnoremap < <gv
" Indent 1 level to the >>right>> selected code in visual mode
vnoremap > >gv

set tabstop=2		" Number of spaces that <Tab> in the file counts for

set shiftwidth=2	" Number of spaces to use for each step of (auto)indent

set softtabstop=2   " Number of spaces that a <Tab> counts for while performing
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

if exists("&colorcolumn")
  set colorcolumn=+1  " Print color column at position 'textwidth'+1 
  highlight ColorColumn ctermbg=233
endif

set formatoptions=c,q,r   " This is the sequence of letters which describes
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

" Shortcuts to format
vmap Q gq
nmap Q gqap

set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma

set background=dark " When set to 'dark', Vim will try to use colors that look
                    " good on a dark background. When set to 'light', vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal

set history=700     " Remember last n commands

set undolevels=100  " Remember last n actions so you can undo them

" Disable backups, swaps
set nobackup
set nowritebackup
set noswapfile

set scrolloff=3     " Keep at least 3 lines above/below cursor


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options for syntastic plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tell syntastic check python with pylint instead of pep8(default)
let g:syntastic_python_checkers = ['pylint']
                                        


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options for Ctrlp plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'   " Change the default mapping and the default
let g:ctrlp_cmd = 'CtrlP'   " command to invoke CtrlP

let g:ctrlp_working_path_mode = 'ra'    " CtrlP will set its local working
"                                         directory according to this variable
"
" c the directory of the current file.
"
" r the nearest ancestor that contains one of these directories or files: 
"   .git, .hg, .svn, .bzr, _darcs, and your own root markers defined with the 
"   g:ctrlp_root_markers option.
" 
" a like 'c', but only applies when the current working directory outside 
"   of CtrlP isn't a direct ancestor of the directory of the current file.

" Exclude files or directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.pyc,*/build_scons/*  

" ctrlp_user_command is NOT compatible with wildignore. Don't uncomment.
" let g:ctrlp_user_command = 'find %s -type f'    " Specify an external tool to
                                                " use for listing files instead
                                                " of using Vim's globpath().
                                                " Use %s in place of the target
                                                " directory.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CScope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('cscope')
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

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    cnoreabbrev <expr> csa
        \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs add'  : 'csa')
    cnoreabbrev <expr> csf
        \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find' : 'csf')
    cnoreabbrev <expr> scsf
        \ ((getcmdtype() == ':' && getcmdpos() <= 5)? 'scs find' : 'scsf')
    cnoreabbrev <expr> csk
        \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs kill' : 'csk')
    cnoreabbrev <expr> csr
        \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs reset' : 'csr')
    cnoreabbrev <expr> css
        \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs show' : 'css')
    cnoreabbrev <expr> csh
        \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs help' : 'csh')

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
    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <Leader><space> :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>x :lol

    " go to next match
    map <C-@>n <ESC>:cnext<CR>
    " go to previous match
    map <C-@>p <ESC>:cprev<CR>

endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_indent = 1                                 " Enable PEP8 indent
let g:pymode_folding = 1                                " Enable folding
let g:pymode_rope_goto_definition_bind = '<Leader>g'    "
let g:pymode_rope_goto_definition_cmd = 'new'          " Open window with def

" let ropevim_enable_shortcuts = 1     https://github.com/python-rope/ropevim

let g:pymode_syntax = 1 
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0

let g:pymode_lint = 0   " Turn off code checking, syntastic does this better
let g:pymode_lint_on_fly = 1                        " Check code when editing.
let g:pymode_lint_message = 1   " Show error message if cursor at error line.
let g:pymode_lint_checkers = ['pylint'] " lint commands to be used

" To add a breakpoint at cursor position
let g:pymode_breakpoint = 1                 " Enable breakpoint insertions
let g:pymode_breakpoint_bind = '<leader>b'  " Bind key
let g:pymode_breakpoint_cmd = ''    " breakpoint command (leave empty for
                                    " automatic detection)
" If the above doesn't work, uncomment next line:
"map <Leader>b Oimport pdb; pdb.set_trace() # BREAKPOINT<C-c>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>l <ESC>:TagbarToggle<cr>
imap <leader>l <ESC>:TagbarToggle<cr>i

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>n <ESC>:NERDTreeToggle<cr>
imap <leader>n <ESC>:NERDTreeToggle<cr>i

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set noshowmode
set t_Co=256 
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#branch#empty_message = 'no branch'

" disable detection of whitespace errors.
let g:airline#extensions#whitespace#enabled = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap :blame<CR> :tab split<CR>:Gblame<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XML Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Autocompletion of C++                                                         
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
set pumheight=10             " so the complete menu doesn't get too big         
set completeopt=menu,longest " menu, menuone, longest and preview               
let g:SuperTabDefaultCompletionType='context'                                   
" let g:clang_library_path=''
let g:clang_complete_auto=0  " I can start the autocompletion myself, thanks..  
let g:clang_snippets=1       " use a snippet engine for placeholders            
let g:clang_snippets_engine='ultisnips'                   " automatically select and insert the first matchu
