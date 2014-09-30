
"filetype off
"filetype plugin indent off     " required!
"if has('vim_starting')
"    set runtimepath+=~/.vim/bundle/neobundle.vim/
"    call neobundle#rc(expand('~/.vim/bundle/'))
"endif

set list		" 不可視文字表示
set listchars=tab:>\ \,trail:_,extends:>,precedes:<

set nocompatible               " Be iMproved
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'https://github.com/Shougo/vimproc.vim.git'

" motion
"NeoBundle 'https://github.com/Lokaltog/vim-easymotion.git'
NeoBundle 'https://github.com/justinmk/vim-sneak.git'
"nmap ; <Plug>SneakNext
nmap - <Plug>SneakPrevious

" filer
NeoBundle 'https://github.com/Shougo/vimfiler.vim.git'
NeoBundle 'https://github.com/thinca/vim-qfreplace.git'
NeoBundle 'https://github.com/kien/ctrlp.vim.git'

" Unite
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/h1mesuke/unite-outline.git'
NeoBundle 'https://github.com/tsukkee/unite-tag.git'
NeoBundle 'https://github.com/tsukkee/unite-help.git'
NeoBundle 'https://github.com/thinca/vim-unite-history.git'
NeoBundle 'https://github.com/tacroe/unite-mark.git'

" programing
"NeoBundle 'https://github.com/vim-scripts/taglist.vim.git'
NeoBundle 'https://github.com/houtsnip/vim-emacscommandline.git'
NeoBundle 'https://github.com/thinca/vim-ft-svn_diff.git'
NeoBundle 'https://github.com/vim-scripts/DirDiff.vim.git'
NeoBundle 'https://github.com/AndrewRadev/splitjoin.vim.git'
"nmap ss :SplitjoinSplit<cr>
"nmap sj :SplitjoinJoin<cr>


"
NeoBundle 'https://github.com/ddollar/nerdcommenter.git'
let NERDSpaceDelims = 1
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle

NeoBundle 'https://github.com/scrooloose/syntastic.git'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

NeoBundle 'https://github.com/terryma/vim-multiple-cursors.git'

"NeoBundle 'https://github.com/mhinz/vim-signify.git'

NeoBundle 'https://github.com/bling/vim-airline.git'
let g:airline#extensions#tabline#enabled = 1
set t_Co=256

"NeoBundle 'https://github.com/jaxbot/selective-undo.vim.git'

NeoBundle 'https://github.com/zeekay/vice-colorful.git'
colorscheme molokai-dark

"NeoBundle 'https://github.com/tomasr/molokai.git'
"colorscheme molokai
"let g:rehash256 = 1
"let g:molokai_original = 1

NeoBundle 'https://github.com/tmhedberg/matchit.git'

NeoBundle 'https://github.com/ervandew/supertab.git'

NeoBundle 'scrooloose/nerdtree'
let g:NERDTreeShowBookmarks=1		"起動時にBookmarkを表示
nnoremap <silent> tr :NERDTree<CR>

NeoBundle 'vim-scripts/taglist.vim'
let Tlist_Show_One_File = 1             "現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1          "右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1           "taglistのウインドウだけならVimを閉じる
nnoremap <silent> tl :TlistToggle<CR>   "tlでtaglistウインドウを開閉


NeoBundle 'https://github.com/thinca/vim-qfreplace.git'

" window
"NeoBundle 'https://github.com/vim-scripts/ZoomWin.git'
"
NeoBundle 'https://github.com/vim-ruby/vim-ruby.git'

NeoBundle 'https://github.com/Shougo/neocomplcache.vim.git'
" => neocomplcache.vim {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/Shougo/neocomplcache.vim
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#CompleteTags
"}}}

"snippet
NeoBundle 'https://github.com/Shougo/neosnippet.vim.git'
NeoBundle 'https://github.com/Shougo/neosnippet-snippets.git'
NeoBundle 'https://github.com/glidenote/serverspec-snippets.git'
let g:neosnippet#snippets_directory = [
      \'~/.vim/snippets',
      \'~/.vim/bundle/serverspec-snippets',
      \]


"NeoBundle 'https://github.com/ryuzee/neosnippet_chef_recipe_snippet.git'
" => neosnippet.vom {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/Shougo/neosnippet.vim

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"}}}

" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=300

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" https://sites.google.com/site/vimdocja/fold-html
" Enable folding.
set foldenable
" set foldmethod=expr
set foldmethod=marker
" Show folding level.
"set foldcolumn=3

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Search
set hlsearch
set wrapscan        " 最後まで検索したら先頭へ戻る
set ignorecase      " 大文字小文字無視
set smartcase       " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch       " インクリメンタルサーチ

" Escの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

set autoindent          " 自動でインデント
set smartindent         " 新しい行のインデントを現在行と同じ量にする


" set system $PATH
" http://vim.1045645.n5.nabble.com/setting-vim-path-to-coincide-always-with-the-system-path-td1171918.html
" let &path=tr(expand("$PATH"),":",",") 
let &path=tr(expand("$PATH"),":",",") 
"}}}


" => for ctags {{{
""""""""""""""""""""""""""""""
" tags-and-searchはtに統一
" http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation

" tを解除
nnoremap t  <Nop>

nnoremap tc  :!/opt/local/bin/ctags<space>-R<CR>

"「飛ぶ」
nnoremap tt  <C-]>
nnoremap tT  g]
"「進む」
nnoremap tj  :<C-u>tag<CR>
"「戻る」
nnoremap tk  :<C-u>pop<CR>
"履歴一覧
" nnoremap tl  :<C-u>tags<CR>

nnoremap tg  :tag<space>
" タグが複数の時にリストを表示
nnoremap ts  :tselect<Return>
nnoremap tS  :tselect<space>/^

" タグが複数の時にリストを表示
nnoremap tn  :tnext<Return>
nnoremap tp  :tprevious<Return>

"nnoremap ,L  :tlast<Return>
"nnoremap ,F  :tfirst<Return>
"
set tags=./tags,tags

" Tlist
nnoremap tl  :TlistToggle<Return><C-w>=

" Triniy
nnoremap tr  :TrinityToggleAll<Return><C-w>=
"}}}

" tagbar.vim
nmap tb :TagbarToggle<CR>

" => JS section {{{
""""""""""""""""""""""""""""""
augroup javascript
      autocmd FileType javascript
	\ setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
augroup END
"}}}


" => Ruby section {{{
""""""""""""""""""""""""""""""
augroup ruby
      autocmd FileType ruby
        \   setlocal makeprg=ruby\ -cdw\ %
        \|  setlocal errorformat=%f:%l:%m
        \|  setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
augroup END
"}}}


" => Python section {{{
""""""""""""""""""""""""""""""
augroup python
      autocmd FileType python
        \  setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
augroup END
"}}}


" => Ruby section {{{
""""""""""""""""""""""""""""""
augroup markdown
      autocmd FileType markdown
        \ setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
augroup END
"}}}
"

nnoremap    [unite]   <Nop>
nmap    <leader>f [unite]

nnoremap [unite]u  :<C-u>Unite<Space>
"nnoremap <silent> ;  :<C-u>Unite history/command command<CR>
nnoremap <silent> [unite];  :<C-u>Unite history/command command<CR>
"nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
"nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]l  :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files file_rec<CR>
"nnoremap <silent> [unite]rm  :<C-u>Unite ref/man<CR>
"nnoremap <silent> [unite]re  :<C-u>Unite ref/erlang<CR>
"nnoremap <silent> [unite]rr  :<C-u>Unite ref/refe<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]j  :<C-u>Unite mark<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline:!<CR>
nnoremap <silent> [unite]p  :<C-u>Unite outline -auto-preview<CR>
nnoremap <silent> [unite]g  :<C-u>Unite grep<CR>
nnoremap <silent> [unite]t  :<C-u>UniteWithCursorWord -buffer-name=tag tag<CR>
nnoremap <silent> [unite]h  :<C-u>Unite help<CR>
nnoremap <silent> [unite]t  :<C-u>Unite tag<CR>
"nnoremap <silent> [unite]s  :<C-u>Unite snippet<CR>

"nnoremap <silent> [unite]r  :<C-u>Unite rails/
"nnoremap <silent> [unite]c  :<C-u>Unite rails/controller<CR>
"nnoremap <silent> [unite]m  :<C-u>Unite rails/model<CR>
"nnoremap <silent> [unite]v  :<C-u>Unite rails/view<CR>
"nnoremap <silent> [unite]a  :<C-u>Unite rails/asset<CR>
"nnoremap <silent> [unite]s  :<C-u>Unite rails/spec<CR>

nnoremap <silent> [unite]u  :<C-u>UniteResume<CR>

" nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " Overwrite settings.
  imap <buffer> jj      <Plug>(unite_insert_leave)
  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  " Start insert.
  let g:unite_enable_start_insert = 1
endfunction

let g:unite_source_file_mru_limit = 200

" unite-grep
let g:unite_source_grep_default_opts = '-iRHn'
let g:unite_source_grep_command = 'ack-grep'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200
 
" unite-grepのキーマップ
" 選択した文字列をunite-grep
" https://github.com/shingokatsushima/dotfiles/blob/master/.vimrc
vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>


" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

"map <C-right> :tabnext<cr>
"map <C-left> :tabprevious<cr>

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

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
  set stal=2
catch
endtry
"}}}


" => neosnippet.vim {{{
""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"}}}


"vimfiler {{{
"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
"現在開いているバッファのディレクトリを開く
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
"現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
 
"デフォルトのキーマッピングを変更
augroup vimrc
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> q <Plug>(vimfiler_exit)
  nmap <buffer> Q <Plug>(vimfiler_hide)
endfunction
 
"}}}


"Markdown Preview Plus {{{
map <leader>md :MkdChrome<cr>
command! MkdChrome call MkdChrome()
function! MkdChrome()
    call system('chromium-browser ' . expand('%'))
endfunction
"}}}
