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

" ================ Haskell ================== {
"
" ---------- VERY IMPORTANT -----------
" Don't forget to install ghc-mod with:
" cabal install ghc-mod
" -------------------------------------

Plugin 'scrooloose/syntastic'             " syntax checker
" --- Haskell
Plugin 'yogsototh/haskell-vim'            " syntax indentation / highlight
Plugin 'enomsg/vim-haskellConcealPlus'    " unicode for haskell operators
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'Twinside/vim-hoogle'
Plugin 'pbrisbin/html-template-syntax'    " Yesod templates

" }

Plugin 'guns/xterm-color-table.vim'

Plugin 'bling/vim-airline'



call vundle#end()

filetype plugin indent on


