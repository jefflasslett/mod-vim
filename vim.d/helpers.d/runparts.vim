
" Source the parts of vim config that match the given pattern.
" Parts are located in the ~/.vim.d/parts.d/ directory (g:mod_parts_dir).
silent function! Mod_runConf(pattern)

  let parts_str = system( 'ls -1 '.g:mod_conf_dir.'/*'.a:pattern.'.vim' )
  let parts = split( parts_str )

  for part in parts
    exec 'source '.part
  endfor

endfunction

