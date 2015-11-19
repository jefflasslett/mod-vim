let mapleader=","
let g:mapleader=","

" Haskell key mappings
" ============================================================================
nmap <silent> <leader>ht :GhcModType<CR>
nmap <silent> <leader>hh :GhcModTypeClear<CR>
nmap <silent> <leader>hT :GhcModTypeInsert<CR>
nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>:lopen<CR>
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>:lopen<CR>


" NerdTree key mappings
" ============================================================================
if isdirectory(expand(g:mod_plugins_dir . "/nerdtree"))
  map <C-e> :NERDTreeToggle<CR>
  map <leader>e :NERDTreeFind<CR>
  nmap <leader>nt :NERDTreeFind<CR>
endif

" CtrlP key mappings
" ============================================================================
let g:ctrlp_map = '<C-p>'

