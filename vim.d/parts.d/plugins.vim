" Setup Bundle Support {
    " The next three lines ensure that the ~/.vim.d/plugin.d/ system works
set nocompatible
filetype off
exec 'set rtp+='.g:mod_plugins_dir.'/Vundle.vim'
call vundle#begin()
" }

" Add an UnBundle command {
function! UnBundle(arg, ...)
  let bundle = vundle#config#init_bundle(a:arg, a:000)
  call filter(g:bundles, 'v:val["name_spec"] != "' . a:arg . '"')
endfunction

com! -nargs=+  UnBundle call UnBundle(<args>)
" }


Plugin 'gmarik/Vundle.vim'
Plugin 'jefflasslett/coding_goodness'


call vundle#end()

filetype plugin indent on


