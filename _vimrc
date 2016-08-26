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
set guifont=Consolas:h14
" set guifont=YaHei\ Consolas\ Hybrid\ 11.5
set hlsearch
":set list
":set listchars=tab:>-
set listchars=trail:$
":set expandtab

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"to conf plugin-NERD_Tree
map <C-l> :tabn<cr>
map <C-h> :tabp<cr>
map <C-n> :tabnew<cr>
map <C-k> :bn<cr>
map <C-j> :bp<cr>

set incsearch
set ignorecase
set nocompatible
set wildmenu
set background=dark

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

set gcr=a:block-blinkon0
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T

let tagbar_left=1
nnoremap <Leader>tl :TagbarToggle<CR>
let tagbar_width=32
let g:tagbar_compact=1

map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

set number
set cursorline
set nowrap
let g:Powerline_colorscheme='solarized256'
syntax enable
syntax on

set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=4

set foldmethod=syntax

" vundle 配置
set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"my Bundle here:
"
" original repos on github
Bundle 'kien/ctrlp.vim'
Bundle 'sukima/xmledit'
Bundle 'sjl/gundo.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'klen/python-mode'
Bundle 'Valloric/ListToggle'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 't9md/vim-quickhl'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'ervandew/supertab'
Bundle 'zeis/vim-kolor'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-shell'
Bundle 'Lokaltog/vim-powerline'
Bundle 'plasticboy/vim-markdown'
"..................................
" vim-scripts repos
Bundle 'YankRing.vim'
Bundle 'vcscommand.vim'
Bundle 'ShowPairs'
Bundle 'SudoEdit.vim'
Bundle 'EasyGrep'
Bundle 'VOoM'
Bundle 'VimIM'
Bundle 'TaskList.vim'
"..................................
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"......................................
call vundle#end()
filetype plugin indent on

" config Gundo
noremap <F5> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_width = 70
let g:gundo_preview_height = 35

" config NERD_Tree
map <c-l> :tabn<CR>
map <c-h> :tabp<CR>
map <c-n> :tabnew<CR>
map <c-k> :bn<CR>
map <c-j> :bp<CR>
nnoremap <F3> :NERDTreeToggle<CR>

" to conf plugin-SuperTab
au FileType python set omnifunc=pythoncompelete#Complete
let g:SuperTabDefaultCompletionType = "context"

" to conf plugin-pymode
let g:pymode_lint_write = 0
