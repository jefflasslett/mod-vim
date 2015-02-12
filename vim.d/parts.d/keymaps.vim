
if isdirectory(expand("~/.vim/bundle/nerdtree"))
  map <C-e> :NERDTreeToggle<CR>
  map <leader>e :NERDTreeFind<CR>
  nmap <leader>nt :NERDTreeFind<CR>
endif

:nmap <C-b> :Unite -quick-match buffer<CR>

