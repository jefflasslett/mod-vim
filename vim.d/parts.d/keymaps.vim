
if isdirectory(expand("~/.vim/bundle/nerdtree"))
  map <C-e> :NERDTreeToggle<CR>
  map <leader>e :NERDTreeFind<CR>
  nmap <leader>nt :NERDTreeFind<CR>
endif

" CtrlP key mappings
" ============================================================================
let g:ctrlp_map = '<C-p>'

