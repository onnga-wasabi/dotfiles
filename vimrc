set nu
set cursorline
set nowrap
set background=dark
set termguicolors " ターミナルでも True Color を使えるようにする。
let g:terminal_color_0 = '#000000' " black
let g:terminal_color_1 = '#d11b24' " red
let g:terminal_color_2 = '#738A04' " green
let g:terminal_color_3 = '#d8af5f' " yellow
let g:terminal_color_4 = '#208fff' " blue
let g:terminal_color_5 = '#c61b6f' " magenta
let g:terminal_color_6 = '#69f6e7' " cyan
let g:terminal_color_7 = '#fafaf0' " white
let g:terminal_color_8 = '#4A9FC3' " black(bright)
let g:terminal_color_9 = '#d75f87' " red(bright)
let g:terminal_color_10 = '#87af87' " green(bright)
let g:terminal_color_11 = '#ffd787' " yellow(bright)
let g:terminal_color_12 = '#add4fb' " blue(bright)
let g:terminal_color_13 = '#ffafaf' " megenta(bright)
let g:terminal_color_14 = '#87d7d7' " cyan(bright)
let g:terminal_color_15 = '#fafaf0' " white(bright)

set list "tab space 表示
set signcolumn=yes "nu左のスペース
let g:tex_conceal='' " マルチバイトをいい感じにする機能を停止-みにくい

" indentation {{{
set smartindent
set autoindent
set cindent
set expandtab
set tabstop=2
set shiftwidth=2
set noequalalways "window size
" }}}

" {{{ features
set showmatch
set matchtime=1
set keywordprg=:help
set noswapfile
set hidden " allow to change buffer w/o saveing
set clipboard+=unnamed "vim -> system clipboard
" }}}

" functions {{{
" 横でhelpを開く
function! Vh(...) abort
  let vh_cmd = 'vertical belowright help '
  execute a:0 >= 1 ? vh_cmd . a:1 : vh_cmd
endfunction
command! -nargs=? H call Vh(<f-args>)


" ウィンドウを閉じずにバッファを閉じる
" refer to: https://lsifrontend.blog.fc2.com/blog-entry-356.html
command! Ebd call EBufdelete()
function! EBufdelete()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if buflisted(l:currentBufNum)
    execute "silent bd".l:currentBufNum
    " bwipeoutに失敗した場合はウインドウ上のバッファを復元
    if bufloaded(l:currentBufNum) != 0
      execute "buffer " . l:currentBufNum
    endif
  endif
endfunction
" }}}


" mappings {{{
inoremap <C-c> <Esc>
let g:omni_sql_no_default_maps = 1 " sql のデフォルトが邪魔してくる

nnoremap se <Cmd>e ++enc=sjis<CR>
nnoremap su <Cmd>e ++enc=utf-8<CR>

" cursor
nnoremap j gj
nnoremap k gk

" grep
set ignorecase
set smartcase

" files / windows
nnoremap , <Cmd>Ebd<CR>
nnoremap sp <Cmd>bn<CR>
nnoremap sn <Cmd>bp<CR>
nnoremap <C-s> <C-i>
nnoremap <C-w>v <C-w>v<CR><C-w>l
nnoremap ss <Cmd>split<CR>
nnoremap <C-w>n <Nop>
nnoremap <C-c> <Cmd>noh<CR>
nnoremap <C-p> <Cmd>echo expand("%")<CR>

" shortcuts
nnoremap <Space>r <Cmd>source ~/.vimrc<CR>
nnoremap <Space>v <Cmd>e ~/.vimrc<CR>
nnoremap <Space>y gg<S-v><S-g>y
" }}}


syntax on
colorscheme slate
