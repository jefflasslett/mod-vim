
if isdirectory(expand("~/.vim/bundle/nerdtree"))
  map <C-e> :NERDTreeToggle<CR>
  map <leader>e :NERDTreeFind<CR>
  nmap <leader>nt :NERDTreeFind<CR>
endif

:nnoremap <C-b> :Unite -quick-match buffer<CR>
:nnoremap <C-p> :Unite -start-insert file_rec/async<CR>

