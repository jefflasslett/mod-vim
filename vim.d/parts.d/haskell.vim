
" -------------------
"       Haskell
" -------------------

let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" let hscoptions="EMtBQZ"

let g:syntastic_mode_map={'mode': 'active', 'passive_filetypes': ['haskell']}
let g:syntastic_always_populate_loc_list = 1

set tm=2000

" Auto-checking on writing
autocmd BufWritePost *.hs,*.lhs GhcModCheckAndLintAsync

"  neocomplcache (advanced completion)
" autocmd BufEnter *.hs,*.lhs let g:neocomplcache_enable_at_startup = 1
function! SetToCabalBuild()
    if glob("*.cabal") != ''
        set makeprg=cabal\ build
    endif
endfunction
autocmd BufEnter *.hs,*.lhs :call SetToCabalBuild()

" -- neco-ghc
let $PATH=$PATH.':'.expand("~/.cabal/bin")

