" PythonPath {{{ cite from https://github.com/n-kats/dotfiles/blob/master/init.vim#L1-L26
let s:has_pipenv=system('type pipenv >/dev/null && echo -n 1')
let s:has_pyenv=system('type pyenv &>/dev/null && echo -n 1')

let g:python_host_prog=""

if s:has_pipenv
  let s:is_pipenv_active=system('pipenv --venv &>/dev/null && echo -n 1')
else
  let s:is_pipenv_active=0
endif

if s:is_pipenv_active
  let g:python3_host_prog=system('echo -n $(pipenv --py)')
elseif s:has_pyenv
  let s:is_not_pyenv_active=system('(pyenv version | grep system) &>/dev/null && echo -n 1')
  if s:is_not_pyenv_active
    let g:python3_host_prog=$PYENV_ROOT.'/versions/neovim/bin/python'
  else
    let g:python3_host_prog=system('echo -n $(which python)')
  endif
else
  let g:python3_host_prog=system('echo -n $(which python3)')
endif
" }}}

" let g:python3_host_prog=system('echo -n $(which python3)')
" dein {{{
if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('$HOME/.cache/dein')

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  let s:toml_dir = expand('$HOME/.cache/dein/plugs/')
  call dein#load_toml(s:toml_dir . 'dein.toml',		{'lazy':0})
  " Add lazy load plugins
  call dein#load_toml(s:toml_dir . 'lazy_dein.toml',	{'lazy':1})
  " extra plugins for osx
  let g:is_mac=system('uname | grep Darwin>>/dev/null && echo -n 1')
  if g:is_mac
  call dein#load_toml(s:toml_dir . 'mac_dein.toml',	{'lazy':1})
  endif

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" }}}

" mitame {{{
syntax on
set background=dark
colorscheme solarized8_dark "It depends on flazz/vim-colorschemes plugin

set nu
set virtualedit=onemore
set smartindent
set autoindent
set cursorline
set showmatch
set pumheight=10
set termguicolors    " ターミナルでも True Color を使えるようにする。
set pumblend=30 " 透過度
let g:tex_conceal='' " マルチバイトをいい感じにする機能を停止-みにくい

set nowrap
augroup FileTypeWrapping
    autocmd!
    autocmd BufNewFile,BufRead *.tex setlocal wrap
    autocmd BufNewFile,BufRead *.text setlocal wrap
augroup END
" }}}

" mapping {{{
let mapleader = "\<Space>"
let maplocalleader = "\<Space>" " 


inoremap <C-c> <ESC>
nnoremap j gj
nnoremap k gk
nnoremap , :bd<CR>

nnoremap s <Nop> 
" window間のカーソル移動
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
" windowそのものを移動
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
" tmuxでいうprefix+ctrl-p
nnoremap sr <C-w>r
nnoremap sw <C-w>w
" bufferの移動
nnoremap sn :bp<CR>
nnoremap sp :bn<CR>

nnoremap ss :split<CR>gg
nnoremap sv :vsplit<CR><C-w>l

autocmd FileType python nnoremap <Leader>p :split<CR>:terminal python %<CR>:set nonumber<CR>
autocmd FileType go nnoremap <Leader>p :split<CR>:terminal go run %<CR>:set nonumber<CR>

nnoremap <Leader>t :Template 

nmap se :e ++enc=sjis<CR>
nmap su :e ++enc=utf-8<CR>

" oritatami
nmap zs :mkview<CR>
nmap zl :loadview<CR>

" Defx
nnoremap <Leader><Leader> :Defx<CR>

nmap [figitive] <Nop>
map <Leader>g [figitive]
nmap <silent> [figitive]s :<C-u>Gstatus<CR>
nmap <silent> [figitive]d :<C-u>Gdiff<CR>
nmap <silent> [figitive]b :<C-u>Gblame<CR>
nmap <silent> [figitive]l :<C-u>Glog<CR>

" Coc-mapping
set signcolumn=yes
inoremap <silent><expr> <c-k> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}

" Indentation {{{
set tabstop=2
set shiftwidth=2
set expandtab
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.tex setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
" }}}

" guake
set guicursor=
autocmd OptionSet guicursor noautocmd set guicursor=

