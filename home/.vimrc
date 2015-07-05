"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (managed by Vundle)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible               
let g:vundle_lazy_load=1
filetype off                 

if has("win32") || has("win16")
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  let path='~/vimfiles/bundle'
  call vundle#begin(path)
else
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#rc()
endif


" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim' 
" colorscheme
Plugin 'tomasr/molokai'
" status/tab line 
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1 
" file explorer
Plugin 'scrooloose/nerdtree'
" syntax checker 
Plugin 'scrooloose/syntastic'
let g:syntastic_python_python_exec = 'usr/bin/python3.4'
" csv editor 
Plugin 'chrisbra/csv.vim'
" obvious resize  
Plugin 'talek/obvious-resize.git'
" highlight parentheses "
Plugin 'dbarsam/vim-rainbow-parentheses.git'
" slim syntax highlighting"
Plugin 'slim-template/vim-slim.git'
" surround " 
Plugin 'tpope/vim-surround.git'
" markdown hightlighting
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" ctrlp fuzzy file, buffer, ... finder
Plugin 'kien/ctrlp.vim'
" SuperTab
Plugin 'ervandew/supertab'
" Multiple Cursors
Plugin 'terryma/vim-multiple-cursors'

call vundle#end() 
filetype plugin indent on 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible             " disable vi compatibility
set history=1000             " increase lines of history
set autoread                 " automatically read file changes
au FocusLost * silent! wa    " auto save files when focus lost
set encoding=utf-8           " always write utf-8
set hidden                   " hide buffer instead of closing

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors, Syntax Highlighting, Fonts, ...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on                  " detect filetypes
syntax enable                " enable syntax highlighting 
filetype plugin indent on    " filetype detection, plugin-, indent-files 
set synmaxcol=512            " no syntax coloring for very long lines
colorscheme molokai          " set colorscheme 
" set the font
if has('gui_running')        
  if has("win32") || has("win16")
    set guifont=DejaVu_Sans_Mono:h11:cANSI
  else
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
  endif
endif

let g:vim_markdown_frontmatter=1 " highlight yaml frontmatter

au BufRead,BufNewFile *.md set filetype=markdown  " treat .md as markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent               " auto-indent
set tabstop=4                " tab spacing 4 spaces
set softtabstop=4            " consistent tab behaviour
set shiftwidth=4             " indent/outdent by 4 spaces
set shiftround               " indent/outdent to the nearest tabstop
set expandtab                " use spaces instead of tabs
set nowrap                   " do not auto wrap lines 
filetype plugin indent on    " filetype dependent indent
" show arrow before wrapped lines
let &showbreak = '  ↳ '
set wrap
set cpo=n
set spell                    " enable spell checking

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","            " set leader key
let g:mapleader=","
nnoremap <leader>a :lnext <cr>   " next error
nnoremap <leader>b :lprev<cr>    " prev error
nnoremap <leader>f :s/\v.* - ([^ ]+)$/\1/g<cr> " feeds
inoremap <C-F7> <Esc>        " map F7 to Esc (extra key on keyboard)
map <c-j> <c-w>j             " switching between tabs
map <c-k> <c-w>k             " ...
map <c-l> <c-w>l             " ...
map <c-h> <c-w>h             " ...
vno v <esc>                  " use v in visual mode to switch off
nmap <leader>nt :NERDTree<cr> " run nerd tree
nnoremap <leader>c :w<cr>:SyntasticCheck<cr>    
noremap <C-S> :update<CR>    " save with CTRL+S
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
" obvious resize
noremap <silent> <C-Up> :ObviousResizeUp<CR>
noremap <silent> <C-Down> :ObviousResizeDown<CR>
noremap <silent> <C-Left> :ObviousResizeLeft<CR>
noremap <silent> <C-Right> :ObviousResizeRight<CR>
" Ctrl-e: Go to end of line
inoremap <c-e> <esc>A

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation / Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=2              " allow backspacing over insert etc. 
set scrolloff=7              " keep cursor 7 lines from the top/bottom
set wrapscan                 " set the search scan to wrap lines
set ignorecase               " ignore case when searching
set smartcase                " smart case when searching
set hlsearch                 " highlight search results
set incsearch                " highlight as you search

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber           " show relative line numbers ...
set number                   " ... but absolute for current line 
set ch=2                     " make command line two lines high
set laststatus=2             " always put a status line in
set showmode                 " show current mode
set guioptions-=m            " remove menu bar
set guioptions-=T            " remove toolbar
set guioptions-=r            " remove right-hand scroll bar
set colorcolumn=72,80        " highlight 72/80 column (PEP8)
highlight ColorColumn guibg=gray18
set nofoldenable             " disable folding

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup/Swap Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup                 " no backup files
set nowritebackup            " ... 
set noswapfile               " disable swapfiles 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32") || has("win16")
    set clipboard=unnamed           " use system cliboard
else
    set clipboard=unnamedplus       " use system clipboard 
endif




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
let g:syntastic_mode_map = { 'mode': 'passive',     
                          \ 'active_filetypes': [],     
                          \ 'passive_filetypes': [] } 
let g:syntastic_auto_loc_list=1     

" airline
let g:airline#extensions#tabline#enabled = 1

""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Word Boundaries 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:se iskeyword+=46
:se iskeyword+=45
:se iskeyword+=95


