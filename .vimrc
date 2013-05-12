"" vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin on

autocmd!
set shell=/bin/zsh

Bundle 'gmarik/vundle'
Bundle 'neco-look'
Bundle 'quickrun.vim'
Bundle 'unite.vim'
Bundle 'sudo.vim'
" Bundle 'basyura/jslint.vim'
Bundle 'eregex.vim'
Bundle 'https://github.com/Shougo/neocomplcache/'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'vim-scripts/Align'
Bundle 'kana/vim-fakeclip'
Bundle 'edsono/vim-matchit'
Bundle 'scrooloose/syntastic'


"" generate config
set number
set smartcase
syntax on
filetype plugin on

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
set clipboard=unnamed,autoselect

"" recognizing filetype
au BufReadPost,BufNewFile *.cgi :setl filetype=perl
" jslint
" function! s:javascript_filetype_settings()
 " autocmd BufLeave     <buffer> call jslint#clear()
 " autocmd BufWritePost <buffer> call jslint#check()
 " autocmd CursorMoved  <buffer> call jslint#message()
" endfunction
" autocmd FileType javascript call s:javascript_filetype_settings()
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

" html setting
" function! s:html_filetype_settings()
"   set expandtab
"   set tabstop=2
"   set shiftwidth=2
" endfunction
" autocmd FileType html call s:html_filetype_settings()
" autocmd BufEnter *.tpl call s:html_filetype_settings()
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
set tags+=~/git/fishing/tags
let Tlist_Auto_Open = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 20
nnoremap <C-t> :Tlist<CR>

inoremap <C-l> error_log(print_r($type, true));
inoremap <C-p> <?php  ?>

autocmd filetype perl :compiler perl
autocmd filetype php :compiler php

" utils
" inoremap () ()<LEFT>
" inoremap {} {}<LEFT>
" inoremap [] []<LEFT>
" inoremap '' ''<LEFT>
" inoremap "" ""<LEFT>

let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump=1
let g:syntastic_php_phpcs_args = " --tab-width=4 --standard=PEARish"
" TODO check
let g:syntastic_php_php_args = '-l'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" time
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

if !exists('g:flymake_enabled')
	let g:flymake_enabled = 1
	autocmd BufWritePost *.rb,*.pl,*.pm,*.php silent make
endif

" makeの結果を別ウインドウで開きたいときのやつ
" autocmd QuickFixCmdPost * :copen

" copy to clipboard
" if has("unix") && match(system("uname"),'Darwin') != -1 " mac
"   " http://www.mail-archive.com/vim-latex-devel@lists.sourceforge.net/msg00773.html
"   nnoremap fc :call system("pbcopy", @")<CR>
"   nnoremap fp :r! pbpaste<CR>
" elseif has('win32unix') " cygwin
"   nnoremap fc :call system("putclip", @")<CR>
"   nnoremap fp :r! getclip<CR>
" endif
