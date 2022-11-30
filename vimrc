" dein {{{
" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.cache/dein')
let g:rc_dir = expand('~/.config/nvim/dein/toml')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " load the file which contain the plugin list
  let s:dein_toml     = g:rc_dir . '/dein.toml'
  let s:ftc_toml      = g:rc_dir . '/ft_context.toml'
  let s:ddc_toml      = g:rc_dir . '/ddc.toml'
  let s:ddu_toml      = g:rc_dir . '/ddu.toml'
  let s:tls_toml      = g:rc_dir . '/telescope.toml'
  let s:lsp_toml      = g:rc_dir . '/lsp.toml'
  let s:preview_toml  = g:rc_dir . '/preview.toml'
  let s:tree_toml     = g:rc_dir . '/file_tree.toml'
  let s:notice_toml     = g:rc_dir . '/notice.toml'

  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:ftc_toml, {'lazy': 1})
  call dein#load_toml(s:lsp_toml, {'lazy': 1})
  call dein#load_toml(s:ddc_toml, {'lazy': 1})
  call dein#load_toml(s:tls_toml, {'lazy': 1})
  call dein#load_toml(s:preview_toml, {'lazy': 1})
  call dein#load_toml(s:tree_toml, {'lazy': 1})
  "call dein#load_toml(s:notice_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" automatically install any plug-ins that need to be installed.
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
set updatetime=400
colorscheme onedark
" }}}

" graphix {{{
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
"}}}

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
    execute "silent bwipeout".l:currentBufNum
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


" Foldings {{{
" with treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set foldcolumn=3
set foldlevel=2
set foldmethod=manual
" refer to: https://vim-jp.org/vim-users-jp/2009/10/08/Hack-84.html
" Save fold settings.
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufWinLeave * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent! loadview | endif " silent! じゃないと view 作ってないファイルでエラーが supress されない
autocmd BufWinEnter * if expand('%') != '' && &buftype !~ 'nofile' | silent! loadview | endif
" Don't save options.
set viewoptions-=options
" }}}

