" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" colorschemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'

" utility plugins
NeoBundle 'unite.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'tpope/vim-fugitive'
 \ , { 'depends' :
        \       [ 'L9'
        \       ]
        \   }
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" NeoBundle 'vimtaku/hl_matchit.vim.git' " ブロックをハイライト
NeoBundle 'ujihisa/unite-colorscheme' " :Unite colorscheme -auto-preview が便利 
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'rails.vim'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'quickrun.vim'
NeoBundle 'sudo.vim'
NeoBundle 'eregex.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'vim-scripts/Align'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'dag/vim2hs' " haskell
NeoBundle 't9md/vim-unite-ack'
NeoBundle 'tsukkee/unite-tag.git'


call neobundle#end()




filetype plugin indent on     " Required!

" Installation check.
NeoBundleCheck

"" generate config
colorscheme default
syntax enable
set number
set smartcase
set hlsearch
set tabstop=4
set bs=2                " allow backspacing over everything in insert mode
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set list
set lcs=tab:\|\ ,trail:_
set softtabstop=4
set shiftwidth=4
set fileencodings=utf8,iso-2022-jp,cp932,euc-jp
set noautoindent
set nosmartindent

" vimrcの自動適応
autocmd BufWritePost $MYVIMRC source $MYVIMRC


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
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompleteTags
autocmd FileType perl setlocal omnifunc=perlcomplete#CompleteTags
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

"taglist
" let g:Tlist_Auto_Open = 1
" let g:Tlist_Compact_Format = 1
" let g:Tlist_Exit_OnlyWindow = 1
" let g:Tlist_WinWidth = 20

" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
" nnoremap <silent> ,vf :<C-u>VimFiler<CR>
" nnoremap <silent> ,vf :<C-u>VimFiler -buffer-name=explorer -split -simple --winwidth=20 -toggle -no-quit<CR>
" command Vf VimFiler -buffer-name=explorer -split -simple -winwidth=25 -toggle -no-quit

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
" let g:syntastic_auto_jump=1
" let g:syntastic_php_phpcs_args = " --tab-width=4 --standard=PEARish"
let g:syntastic_php_phpcs_args = " --tab-width=4"
" " TODO check
let g:syntastic_php_php_args = '-l'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" matchit
" source $VIMRUNTIME/macros/matchit.vim

" hl_matchit
" let g:hl_matchit_enable_on_vim_startup = 1
" let g:hl_matchit_hl_groupname = 'Title'
" let g:hl_matchit_allow_ft_regexp = 'html\|vim\|ruby\|sh\|tpl'

" php settings
autocmd filetype php inoremap <C-l> error_log(print_r($type, true));
autocmd filetype php inoremap <C-p> <?php  ?>
autocmd filetype php :compiler php
" autocmd filetype *.tpl let g:tcommentGuessFileType_smarty = 1
au BufReadPost,BufNewFile *.tpl setlocal filetype=smarty

" perl settings
autocmd filetype perl :compiler perl

" key mapping
"Unite.vim
let g:unite_enable_start_insert=1
nnoremap <silent>,ub :<C-u>Unite buffer<CR>
nnoremap <silent>,uf :<C-u>UniteWithBufferDir file file/new -buffer-name=files<CR>
nnoremap <silent>,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent>,um :<C-u>Unite file_mru<CR>
nnoremap <silent>,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" time
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

