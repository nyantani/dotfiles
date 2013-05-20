set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'tpope/vim-fugitive'
 \ , { 'depends' :
        \       [ 'L9'
        \       ]
        \   }
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'rails.vim'
" Non github repos
NeoBundle 'git://git.wincent.com/command-t.git'
" Non git repos
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

"
NeoBundle 'ujihisa/neco-look'
NeoBundle 'quickrun.vim'
NeoBundle 'unite.vim'
NeoBundle 'sudo.vim'
" NeoBundle 'basyura/jslint.vim'
NeoBundle 'eregex.vim'
" NeoBundle 'tpope/vim-rails'
" NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'vim-scripts/Align'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'dag/vim2hs'

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

"" generate config
syntax on
set number
set smartcase
set hlsearch
syntax on
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

" not commenting inserting CR
autocmd FileType * setlocal formatoptions-=ro
set clipboard=unnamed,autoselect

" wq alias
command! -nargs=0 Wq wq

"" recognizing filetype
au BufReadPost,BufNewFile *.cgi setlocal filetype=perl

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
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
let g:neocomplcache_text_mode_filetypes = {
	\ 'text': 1,
	\ 'javascript': 1,
	\ 'markdown': 1,
	\ 'perl': 1,
	\ 'html': 1,
	\ 'php': 1
	\ }

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : '',
			\ }

"Unite.vim
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

"taglist
let Tlist_Auto_Open = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 20
nnoremap <C-t> :Tlist<CR>

" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

" syntastic
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

" php settings
autocmd filetype php inoremap <C-l> error_log(print_r($type, true));
autocmd filetype php inoremap <C-p> <?php  ?>
autocmd filetype php :compiler php

" perl settings
autocmd filetype perl :compiler perl

" time
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')
