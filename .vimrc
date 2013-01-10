"" vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin on

Bundle 'gmarik/vundle'
Bundle 'neco-look'
Bundle 'quickrun.vim'
Bundle 'unite.vim'
Bundle 'sudo.vim'
Bundle 'basyura/jslint.vim'
Bundle 'eregex.vim'
Bundle 'https://github.com/Shougo/neocomplcache/'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'vim-scripts/Align'

"" generate config
set number
syntax on

" hilight search
set hlsearch

" tab
set tabstop=4
set bs=2                " allow backspacing over everything in insert mode
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set list
set lcs=tab:>-,trail:_
set softtabstop=4
set shiftwidth=4
set fileencodings=utf8,iso-2022-jp,cp932,euc-jp
autocmd FileType * setlocal formatoptions-=ro " not commenting inserting CR
"set autoindent
"set smartindent

"" recognizing filetype
au BufReadPost,BufNewFile *.cgi :setl filetype=perl
" jslint
function! s:javascript_filetype_settings()
 autocmd BufLeave     <buffer> call jslint#clear()
 autocmd BufWritePost <buffer> call jslint#check()
 autocmd CursorMoved  <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

"" color
"colorscheme zenburn
"set autowrite
" colorscheme zenburn
"colorscheme h2u_black

"" place cursor previously placed 
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

"" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
" quick match
let g:neocomplcache_enable_quick_match = 1

" Enterで候補決定
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"Unite.vim
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" autocmd
augroup SkeletonAu
	autocmd!
	autocmd BufNewFile *.pl 0r /home/.vim/skel.pl
	autocmd BufNewFile *.pm 0r /home/.vim/skel.pm
	autocmd BufNewFile *.cgi 0r /home/.vim/skel.cgi
	autocmd BufNewFile *.html 0r /home/.vim/skel.html
augroup END

"taglist
let Tlist_Auto_Open = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 20
nnoremap <C-t> :Tlist<CR>

"php syntax check type ':make' to check syntax of current file
autocmd filetype php :set makeprg=php\ -l\ %
autocmd filetype php :set errorformat=%m\ in\ %f\ on\ line\ %l
inoremap <C-l> error_log(print_r($type, true));
