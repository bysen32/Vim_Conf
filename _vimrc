set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"Set the status line options. Make it show more information.
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\[POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

"Set Color Scheme and Font Options
colorscheme slate

"set line no, buffer, search, highlight, autoindent and more.
set nu
set hidden
set ignorecase
set incsearch
set smartcase
set showmatch
set autoindent
set ruler
set vb
set viminfo+=n$VIM/_viminfo
set noerrorbells
set showcmd
set mouse=a
set history=1000
set undolevels=1000

"Personal Settings.
"More to be added soon.
set fileencoding=utf-8
set fileencodings=utf-8,cp936,ucs-bom,big5
set guifont=Courier\ New:h13
set hlsearch
":set list
":set listchars=tab:>-
set listchars=trail:$
":set expandtab

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"to conf plugin-pathogen
execute pathogen#infect()
filetype plugin indent on
syntax on
set foldmethod=indent
set foldlevel=99

"to conf plugin-Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_width = 70
let g:gundo_preview_height = 35

"to conf plugin-pyflaks
let g:pyflakes_use_quickfix = 0

"to conf plugin-syntastic
let g:syntastic_python_python_exec = 'C:\\Python27'
let g:syntastic_enable_perl_checker = 1

"to conf plugin-NERD_Tree
map <C-l> :tabn<cr>
map <C-h> :tabp<cr>
map <C-n> :tabnew<cr>
map <C-k> :bn<cr>
map <C-j> :bp<cr>
nnoremap <F3> :NERDTree<CR>

"to conf plugin-SuperTab
au FileType python set omnifunc=pythoncompelete#Complete
let g:SuperTabDefaultCompletionType = "context"

"to conf plugin-pymode
let g:pymode_lint_write = 0

"to conf plugin-pydoc
let g:pydoc_cmd = 'python -m pydoc'
let g:pydoc_open_cmd = 'vsplit'
