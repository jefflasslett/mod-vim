" The next three lines ensure that the plugin system works
set nocompatible

filetype on  " Work-around for a possible problem on macs
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'gmarik/Vundle.vim'
Plugin 'jefflasslett/coding_goodness'
Plugin 'scrooloose/nerdtree'

Plugin 'Shougo/vimproc'
Plugin 'Shougo/unite.vim'

Plugin 'tpope/vim-fugitive'

" ================ Haskell ================== {
"
" ---------- VERY IMPORTANT -----------
" Don't forget to install ghc-mod with:
" cabal install ghc-mod
" -------------------------------------

Plugin 'scrooloose/syntastic'             " syntax checker
" --- Haskell
" Plugin 'enomsg/vim-haskellConcealPlus'    " unicode for haskell operators
Plugin 'Twinside/vim-haskellConceal'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'Twinside/vim-hoogle'
Plugin 'pbrisbin/html-template-syntax'    " Yesod templates

" Plugin 'Twinside/vim-haskellFold'
 
Plugin 'travitch/hasksyn'
" Plugin 'dag/vim2hs'
" Plugin 'bitc/vim-hdevtools'
" Plugin 'adinapoli/cumino'
" Plugin 'lukerandall/haskellmode-vim'

" }

Plugin 'guns/xterm-color-table.vim'

Plugin 'bling/vim-airline'

Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'


call vundle#end()

filetype plugin indent on


