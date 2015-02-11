set autoindent
set smartindent
set nowrap
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
"set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

" TODO: Decide what to do about trailing whitespace and
" StripTrailingWhitespace function.
"
" Remove trailing whitespaces and ^M chars
"   let g:spf13_keep_trailing_whitespace = 1
" autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif

" Workaround vim-commentary for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s

" Workaround broken colour highlighting in Haskell
autocmd FileType haskell,rust setlocal nospell

