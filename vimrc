if has('win32')
   let &runtimepath = substitute(&runtimepath, '\(\~\|'.$USER.'\)/vimfiles\>', '\1/.vim', 'g')
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"{{{Auto Commands

autocmd VimEnter * set vb t_vb=

" Restore cursor position to where it was before
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

"}}}

"{{{Misc Settings

" PERSISTENT UNDO
set undofile

set history=10000
set viminfo='10,\"100,:10000,%,n~/.viminfo

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
" Necessary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
set showcmd

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab

" Who wants an 8 character tab?  Not me!
set sw=3
set ts=3

set tw=80

" Cool tab completion stuff
set wildmenu
set wildmode=full

" Enable mouse support in console
set mouse=a

" Got backspace?
set backspace=2

" Line Numbers PWN!
set number

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intelligence!
set smartcase

" This is totally awesome - remap jk to escape in insert mode.  You'll never type jk anyway, so it's great!
inoremap jk <Esc>

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" Since I use Linux, I want this
let g:clipbrdDefaultReg = '+'

" allow selection of nothing
set virtualedit=block

" I never use octal (or hex?) so only treat numbers like decimals
set nrformats=
" }}}

"{{{Look and Feel

if has("gui_running")
   " Favorite Color Scheme
   set background=dark
   colorscheme solarized

   " Remove Toolbar
   set guioptions=
   if has('win32')
      set guifont=Consolas:h8
   else
      set guifont=Terminus\ 8
   endif
else
   if &t_Co == 256
      colorscheme inkpot
   else
      colorscheme elflord
   endif
endif

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ [%l,%v][%p%%]

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" }}}

"{{{ Mappings

" fmt
nnoremap <silent> <Leader>fm :.!fmt -w80<CR>
vnoremap <silent> <Leader>fm :!fmt -w80<CR>

" perltidy
nnoremap <silent> <Leader>pt :%!perltidy<CR>
vnoremap <silent> <Leader>pt :!perltidy<CR>

" toppost
nnoremap <silent> <Leader>tp :%!top-post<CR>ggI
vnoremap <silent> <Leader>tp :!top-post<CR>

" Edit vimrc \ev
nnoremap <silent> <Leader>ev :split $MYVIMRC<CR>

" DwarnF a perl var
vnoremap <silent> <Leader>d= :!dwarnf_var_assignment<CR>
nnoremap <silent> <Leader>d= :.!dwarnf_var_assignment<CR>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
noremap N Nzz
noremap n nzz

" http://learnvimscriptthehardway.stevelosh.com/chapters/04.html
nnoremap <c-u> viwU
inoremap <c-u> <esc>viwUi

" Testing
set completeopt=longest,menuone,preview
set complete-=i

inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

" Swap ; and :  Convenient.
noremap : ;
noremap! : ;
noremap ; :
noremap! ; :

iunmap :
iunmap ;

nnoremap <F1> :set cursorcolumn! cursorline!<CR>
inoremap <F1> <esc>:set cursorcolumn! cursorline!<CR>i
nnoremap <F2> :GundoToggle<CR>
inoremap <F2> :GundoToggle<CR>

" Make %% represent the dir of the current buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

nnoremap <F10> :split<CR>
nnoremap <F11> :vsplit<CR>
set pastetoggle=<F12>

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

vmap <expr> ++ VMATH_YankAndAnalyse()
nmap        ++ vip++

"}}}

let g:airline_symbols = {}
if has('win32')
   set listchars=tab:-\ ,eol:$,nbsp:_,trail:.
   set directory=~/var/swap
   set undodir=~/var/undo
   let g:airline_left_sep = '>'
   let g:airline_right_sep = '<'
   let g:airline_symbols.linenr = ''
   let g:airline_symbols.branch = ''
   let g:airline_symbols.whitespace = '='
else
   set listchars=tab:▸\ ,eol:¬,nbsp:~,trail:·
   let g:airline_left_sep = '▶'
   let g:airline_right_sep = '◀'
   let g:airline_symbols.linenr = '␤'
   let g:airline_symbols.branch = '⎇ '
   let g:airline_symbols.whitespace = 'Ξ'
   set directory=~/.vim/var/swap
   set undodir=~/.vim/var/undo
endif

set list

" {{{ ctrlp settings

function! DirCtrlP()
   let g:ctrlp_working_path_mode = 0
   CtrlP
endfunction

function! FileRelCtrlP()
   let g:ctrlp_working_path_mode = 'c'
   CtrlP
endfunction

let g:ctrlp_abbrev = {
  \   "abbrevs": [
  \    {
  \       "pattern": "^lib:",
  \       "expanded": "^lib/"
  \    },
  \    {
  \       "pattern": "^t:",
  \       "expanded": "^t/"
  \    }
  \   ]
  \ }

" put ctrlp matcher on top, ordering top to bottom
let g:ctrlp_match_window = 'top,order:ttb,min:5,max:30'
" search with regexen by default
let g:ctrlp_regexp = 1
nnoremap <silent> <F3> :call DirCtrlP()<CR>
nnoremap <silent> <S-F3> :CtrlPClearCache<CR>
nnoremap <silent> <F4> :call FileRelCtrlP()<CR>
nnoremap <silent> <F5> :CtrlPBuffer<CR>

" }}}
let g:jshintprg="hint"
" vim: foldmethod=marker
