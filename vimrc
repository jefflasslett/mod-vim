" Modeline and Notes {
" vim: set sw=2 ts=2 sts=2 et tw=78:
"
"   Mod(ular) vimrc
"
"   This is the personal .vimrc of Jeff Lasslett.
"
"   It started out as spf-13 (Steve Francia's) vimrc.  But things got out of
"   hand and spf-13 had to be gutted.  Also, I found my vim sessions could get
"   a biiiitt   slloooooow.
"
"   So in the words of the rogue marine to Nick Cage in "The Rock":
"     "I'll take pleasure in guttin' you boy!"
"
"   Below is preserved all of the original licence (which I'm happy to retain)
"   copyright notice, and the link to the spf-13 homepage.
"   ========================================================================
"
"   You can find the original spf-13 at http://spf13.com
"
"   Copyright 2014 Steve Francia
"
"   Licensed under the Apache License, Version 2.0 (the "License");
"   you may not use this file except in compliance with the License.
"   You may obtain a copy of the License at
"
"       http://www.apache.org/licenses/LICENSE-2.0
"
"   Unless required by applicable law or agreed to in writing, software
"   distributed under the License is distributed on an "AS IS" BASIS,
"   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
"   See the License for the specific language governing permissions and
"   limitations under the License.
" }

" Bootstrap {
"
" Create variables to hold the names of important directories in this
" modular config tree:
"
" $HOME (aka ~)
" |
" +-- .vimrc          <- this file. It all starts here
" |
" +-- .vim            <- default install location for vundle plugins
" |   |
" |   +-- bundle      <- vim plugins installed below this dir
" |
" +-- .vim.d          <- The root of our vim config
" |   |
" |   +-- conf.d      <- contains symlinks to 'parts'.  These parts form the
" |   |                  active configuration.
" |   |
" |   +-- parts.d     <- 'parts' fragments of vim config to be sourced by
" |   |   |              .vimrc
" |   |   |
" |   |   +-- <*>        <- other vim config fragments to be included
" |   |
" |   +-- helpers.d      <- fragments of viml with functions to assist the
" |   |                     loading of the config
" |   |
" |   +-- swap.d         <- swap file directory
" |   |
" |   +-- view.d         <- view file directory
" |   |
" |   +-- undo.d         <- undo file directory
" |   |
" |   +-- backup.d       <- backup file directory

  " Assume unix conventions to begin with.  This config won't work on windows
  " first up.

  let g:vim_root_dir    = expand( '~/.config/nvim' )
  let g:mod_root_dir    = g:vim_root_dir.'/mod-vim.d'
  let g:mod_parts_dir   = g:mod_root_dir.'/parts.d'
  let g:mod_helpers_dir = g:mod_root_dir.'/helpers.d'
  let g:mod_plugins_dir = g:vim_root_dir.'/plugins.d'
  let g:mod_parts_dir   = g:mod_root_dir.'/parts.d'
  let g:mod_conf_dir    = g:mod_root_dir.'/conf.d'
  let g:mod_swap_dir    = g:mod_root_dir.'/swap.d'
  let g:mod_views_dir   = g:mod_root_dir.'/views.d'
  let g:mod_undo_dir    = g:mod_root_dir.'/undo.d'
  let g:mod_backup_dir  = g:mod_root_dir.'/backup.d'

  " Check that the root dir exists, otherwise none of this can work.
  if !isdirectory(g:mod_root_dir)
    let g:no_mod_config = 1
  else
    " Add the helper function dir to the runtime path.
    exec 'set rtp+='.g:mod_helpers_dir
    let g:no_mod_config = 0
  endif

  " Load up the helper functions
  if !g:no_mod_config

    exec 'source '.g:mod_helpers_dir.'/runparts.vim'
    exec 'source '.g:mod_helpers_dir.'/os.vim'

    " No pattern so run each part linked in conf.d dir.  These will be run in
    " lexicograhical order.  The links all have a 3 digit prefix that
    " indicates the order in which they are to be sourced.
    call Mod_runConf( '' )

  endif

" }

