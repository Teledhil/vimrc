" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Add plugins below this line
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'   " Git wrapper. Recommended with airline
Plugin 'kien/ctrlp.vim'       " File browser
Plugin 'python-mode/python-mode'     " For Python development
Plugin 'scrooloose/syntastic' " Syntax analyzer
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
" Go plugin
Plugin 'fatih/vim-go'
" Dart / Flutter
Plugin 'dart-lang/dart-vim-plugin'
" GDB inside vim
" Plugin 'vim-scripts/Conque-GDB'
" VIM theme deep-star
Plugin 'tyrannicaltoucan/vim-deep-space'
" Solarized theme
Plugin 'altercation/vim-colors-solarized'
" Add plugins above this line
call vundle#end()
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

" Terminal mode
" =============
if has('terminal')
  tnoremap <Esc> <C-W>N                  " Press <Esc> to switch to
  set notimeout ttimeout timeoutlen=100  " Terminal-Normal mode.

  tnoremap <c-h> <C-W>N<c-w>h
  tnoremap <c-j> <C-W>N<c-w>j
  tnoremap <c-k> <C-W>N<c-w>k
  tnoremap <c-l> <C-W>N<c-w>k
endif " has('terminal')

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
colorscheme solarized
let g:solarized_termtrans = 1

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

let g:syntastic_cpp_compiler_options = ' -std=c++17 '
let g:syntastic_cpp_config_file = '.syntastic_includes_file_'

" Disable dartanalyzer because is very slow:
" https://github.com/dart-lang/dart-vim-plugin/issues/24
let g:loaded_syntastic_dart_dartanalyzer_checker = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
                                        
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options for Ctrlp plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'   " Change the default mapping and the default
let g:ctrlp_cmd = 'CtrlP'   " command to invoke CtrlP

let g:ctrlp_max_files=20000 " Maximum number of files indexed
                            " Run :CtrlPClearAllCaches to refresh

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
" ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-@> :exec("tag ".expand("<cword>"))<CR>
noremap <Leader><space> <C-]>                   " Another mapping for macOS
                                                " because Ctrl+Space is used to
                                                " switch keyboard languages.


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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" Enable goimports to automatically insert import paths instead of gofmt:
let g:go_fmt_command = "goimports"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dart
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let dart_style_guide = 2    " Enable Dart style guide syntax (2-space indentation)
let dart_format_on_save = 1 " Enable DartFmt execution on buffer save
