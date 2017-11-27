" ~/.config/nvim/init.vim
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tmhedberg/matchit'
"Plug 'unblevable/quick-scope'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neoyank.vim'
Plug 'tsukkee/unite-tag'
Plug 'tsukkee/unite-help'
Plug 'tacroe/unite-mark'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'houtsnip/vim-emacscommandline'
Plug 'thinca/vim-quickrun'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'fatih/vim-go'
Plug 'dgryski/vim-godef'
Plug 'vim-jp/vim-go-extra'
Plug 'Blackrush/vim-gocode'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'terryma/vim-expand-region'
Plug 't9md/vim-choosewin'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'SirVer/ultisnips'
Plug 'nsf/gocode'


" Initialize plugin system
call plug#end()

filetype plugin indent on
filetype on
filetype plugin on
filetype indent on

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

let g:EasyMotion_do_mapping = 0
nmap f <plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

imap jk <ESC>
set history=300
set visualbell t_vb=
set noerrorbells
syntax enable
set synmaxcol=200
set autoread
set foldenable
set foldmethod=marker
set nobackup
set nowb
set noswapfile
nmap <leader>w :w!<cr>:redraw!<cr>
nmap <leader>, :redraw!<cr>
nmap <leader>o :CtrlP<cr>
nmap <Leader><Leader> V

map <leader>ee :lclose<cr>:Errors<cr>
map <leader>q :q<cr>
map <leader>en :cn<cr>
map <leader>ep :cp<cr>
map <leader>er :edit<cr>

map <leader>Ee :e! ~/.vimrc<cr>
map <leader>Ev :e! ~/.vimperatorrc<cr>
map <leader>Ez :e! ~/.zshrc<cr>
map <leader>Et :e! ~/.tmux.conf<cr>

map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
set wrapscan        " 最後まで検索したら先頭へ戻る
set ignorecase      " 大文字小文字無視
set smartcase       " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

" Indent
set autoindent          
set smartindent        

" Move Window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Buffer
map <leader>bd :Bclose<cr>
map <leader>ba :1,300 bd!<cr>
map <right> :bn<cr>
map <left> :bp<cr>
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>th :tabprevious<cr>
map <leader>tl :tabnext<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Move last modified text.
nnoremap gb `.zz
nnoremap g, g;
nnoremap g; g,

nnoremap <leader>sp :set paste<cr>
nnoremap <leader>sn :set nopaste<cr>

" fold
" http://stackoverflow.com/questions/7034215/is-there-a-way-to-expand-a-vim-fold-automatically-when-your-put-your-cursor-on-i
nnoremap <silent> j :<c-u>call MoveUpDown('j', +1, 1)<cr>
nnoremap <silent> k :<c-u>call MoveUpDown('k', -1, 1)<cr>
nnoremap <silent> gj :<c-u>call MoveUpDown('gj', +1, 1)<cr>
nnoremap <silent> gk :<c-u>call MoveUpDown('gk', -1, 1)<cr>
nnoremap <silent> <c-d> :<c-u>call MoveUpDown("\<lt>c-d>", +1, '&l:scroll')<cr>
nnoremap <silent> <c-u> :<c-u>call MoveUpDown("\<lt>c-u>", -1, '&l:scroll')<cr>
nnoremap <silent> <c-f> :<c-u>call MoveUpDown("\<lt>c-f>", +1, 'winheight("%")')<cr>
nnoremap <silent> <c-b> :<c-u>call MoveUpDown("\<lt>c-b>", -1, 'winheight("%")')<cr>
function! MoveUpDown(cmd, dir, ndef)
    let n = v:count == 0 ? eval(a:ndef) : v:count
    let l = line('.') + a:dir * n
    silent! execute l . 'foldopen!'
    execute 'norm! ' . n . a:cmd
endfunction

" Vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>

" Unite
let g:neoyank#limit=10000
let g:neoyank#file=$HOME . '/.vim/yank_history.txt'
nnoremap <leader>y :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]y  :<C-u>Unite history/yank<CR>
nnoremap    [unite]   <Nop>
nmap    <leader>f [unite]
nnoremap [unite]u  :<C-u>Unite<Space>
nnoremap <silent> [unite];  :<C-u>Unite history/command command<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]f  :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]m  :<C-u>Unite mark<CR>
nnoremap <silent> [unite]j  :<C-u>Unite jump<CR> "いままで飛んだところにジャンプ可能!!!!!!
nnoremap <silent> [unite]g  :<C-u>Unite grep<CR>
nnoremap <silent> [unite]t  :<C-u>UniteWithCursorWord -buffer-name=tag tag<CR>
nnoremap <silent> [unite]h  :<C-u>Unite help<CR>
nnoremap <silent> [unite]t  :<C-u>Unite tag<CR>
nnoremap <silent> [unite]c  :<C-u>Unite change<CR>
nnoremap <silent> [unite]s  :<C-u>Unite snippet<CR>
nnoremap <silent> [unite]u  :<C-u>UniteResume<CR>
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <buffer> jj      <Plug>(unite_insert_leave)
  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  let g:unite_enable_start_insert = 1
endfunction
let g:unite_source_file_mru_limit = 200
let g:unite_source_rec_async_command =
	\ ['ag', '--follow', '--nocolor', '--nogroup',
	\  '--hidden', '-g', '-t', '']

" Ctags
set tags=tags;/
nnoremap t  <Nop>
nnoremap tc  :!/usr/bin/ctags<space>-R<space>.<space>--exclude=target<space>--exclude=vendor<CR>
nnoremap tt  <C-]>
nnoremap tT  g]
nnoremap tj  :<C-u>tag<CR>
nnoremap tk  :<C-u>pop<CR>
nnoremap tg  :tag<space>
nnoremap ts  :tselect<Return>
nnoremap tS  :tselect<space>/^
nnoremap tn  :tnext<Return>
nnoremap tp  :tprevious<Return>

" Tarbar
nnoremap <leader>tb :TagbarToggle<CR>

" NerdCommenter
let NERDSpaceDelims = 1
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle


" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" Golang
set path+=$GOPATH/src/**
let g:gofmt_command = 'goimports'
let g:go_fmt_options = {
	\ 'gofmt': '-s',
	\ }
au BufWritePre *.go Fmt
"  au BufWritePost *.go !gotags . -R > tags
au BufWritePost *.go silent! !gotags -R -sort -silent . > tags &
au BufReadPost *.go silent! !gotags -R -sort -silent . > tags &

au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 completeopt=menu
au FileType go compiler go

"  https://github.com/fatih/vim-go#mappings
"  nnoremap gt  :<C-u>GoDef<CR>
let g:godef_split=1
"au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test-func)
au FileType go nmap <leader>gT <Plug>(go-coverage-toggle)

au FileType go nmap <leader>gc <Plug>(go-callees)
au FileType go nmap <leader>gC <Plug>(go-callers)

au FileType go nmap <Leader>gg <Plug>(go-def)
au FileType go nmap <Leader>gs <Plug>(go-def-stack)
au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gL <Plug>(go-lint)
au FileType go nmap <Leader>gv <Plug>(go-vet)
" au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gi :<c-u>GoSameIdsAutoToggle<cr>
au FileType go nmap <Leader>gr :<c-u>GoReferrers<cr>
au FileType go nmap <Leader>gI <Plug>(go-implements)
au FileType go nmap <Leader>gR <Plug>(go-rename)
au FileType go nmap <Leader>ge :<c-u>GoErrCheck<cr>
au FileType go nmap <Leader>gw :<c-u>GoWhicherrs<cr>
au FileType go nmap <Leader>ga <Plug>(go-alternate-vertical)
au FileType go nmap <Leader>gl :<c-u>GoDecls<cr>
au FileType go nmap <Leader>gL :<c-u>GoDeclsDir<cr>
au FileType go nmap <Leader>gp :<c-u>GoPlay<cr>

let g:go_auto_type_info = 1

" https://github.com/fatih/vim-go#using-with-syntastic
"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_go_checkers = ['golint', 'govet', 'go']
let g:syntastic_aggregate_errors = 1
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"  au BufNewFile,BufRead *.go :TagbarOpen<cr>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" https://github.com/golang/lint
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" autocmd BufWritePost *.go execute 'GoLint' | cwindow
" autocmd BufWritePost *.go execute 'GoErrCheck' | cwindow

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" => terryma/vim-expand-region {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"}}}
"
" => t9md/vim-choosewin {{{
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
"}}


" => airblade/vim-gitgutter {{{
" https://github.com/airblade/vim-gitgutter#cycle-through-hunks-in-all-buffers
function! NextHunkAllBuffers()
  let line = line('.')
  GitGutterNextHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bnext
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! 1G
      GitGutterNextHunk
      return
    endif
  endwhile
endfunction

function! PrevHunkAllBuffers()
  let line = line('.')
  GitGutterPrevHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bprevious
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! G
      GitGutterPrevHunk
      return
    endif
  endwhile
endfunction

nmap <silent> ]c :call NextHunkAllBuffers()<CR>
nmap <silent> [c :call PrevHunkAllBuffers()<CR>
"}}

" => Shougo/deoplete.nvim {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.local/share/nvim/plugged/deoplete-go/data/json/1.7.3/darwin_amd64'
"}}

" => SirVer/ultisnips {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"}}
