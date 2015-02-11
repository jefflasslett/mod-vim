" Initialize directories {
function! Mod_initializeDirectories()

  let dir_list = {
              \ 'backupdir': g:mod_backup_dir,
              \ 'viewdir': g:mod_views_dir,
              \ 'directory': g:mod_swap_dir }

  if has('persistent_undo')
    let dir_list['undodir'] = g:mod_undo_dir
  endif

  for [settingname, dirname] in items(dir_list)

    if exists("*mkdir")
      if !isdirectory(dirname)
        call mkdir(dirname)
      endif
    endif

    if !isdirectory(dirname)
      echo "Warning: Unable to create backup directory: " . directory
      echo "Try: mkdir -p " . directory
    else
      let dirname = substitute(dirname, " ", "\\\\ ", "g")
      exec "set " . settingname . "=" . dirname
    endif

  endfor

endfunction

call Mod_initializeDirectories()

" }


