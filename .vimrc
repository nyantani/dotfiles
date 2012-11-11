set number

" tab
set tabstop=4
"set autoindent
"set smartindent

set softtabstop=4
set shiftwidth=4
set fileencodings=utf8,iso-2022-jp,cp932,euc-jp
syntax on
"colorscheme zenburn
set autowrite
au BufReadPost,BufNewFile *.cgi :setl filetype=perl
" neocomplcache
let g:neocomplcache_enable_at_startup=1
" nardcommentater

" color
" colorscheme zenburn
"colorscheme h2u_black

" hilight search
set hlsearch

" autocmd
augroup SkeletonAu
	autocmd!
	autocmd BufNewFile *.pl 0r /home/.vim/skel.pl
	autocmd BufNewFile *.pm 0r /home/.vim/skel.pm
	autocmd BufNewFile *.cgi 0r /home/.vim/skel.cgi
	autocmd BufNewFile *.html 0r /home/.vim/skel.html
augroup END

" vundle
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
Bundle 'The_NERD_Commenter'
Bundle 'eregex.vim'
Bundle 'https://github.com/Shougo/neocomplcache/'

"filetype plugin indent on 

function! s:javascript_filetype_settings()
 autocmd BufLeave     <buffer> call jslint#clear()
 autocmd BufWritePost <buffer> call jslint#check()
 autocmd CursorMoved  <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()
