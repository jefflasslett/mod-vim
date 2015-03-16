
                                       .o8                       o8o                    
                                      "888                       `"'                    
     ooo. .oo.  .oo.    .ooooo.   .oooo888          oooo    ooo oooo  ooo. .oo.  .oo.   
     `888P"Y88bP"Y88b  d88' `88b d88' `888           `88.  .8'  `888  `888P"Y88bP"Y88b  
      888   888   888  888   888 888   888  8888888   `88..8'    888   888   888   888  
      888   888   888  888   888 888   888             `888'     888   888   888   888  
     o888o o888o o888o `Y8bod8P' `Y8bod88P"             `8'     o888o o888o o888o o888o 
                                                                                   
                                                                                   
               

# mod-vim : a modular vim config

**NOTE: Remodelling in progress.  This config won't auto install. Lot's of features don't work.  I wouldn't recommend it to you (yet).**

I'm not as ambitious as the author of SPF-13.  This is my personal vim config.
It works well for me on my macs and linux, but I've stripped out the windows
support (at least for now).  mod-vim achieves the same ends as spf-13 in that
it installs a set of useful plugins and provide some organisational philosophy 
to the configuration.

Unlike traditional VIM plugin structure, which similar to UNIX throws all files into common directories, making updating or disabling plugins a real mess, mod-vim uses the [Vundle] plugin management system to have a well organized vim directory (Similar to mac's app folders). Vundle also ensures that the latest versions of your plugins are installed and makes it easy to keep them up to date.

# Installation


# Design


```
 $HOME (aka ~)
 |
 +-- .vimrc          <- this file. It all starts here
 |
 +-- .vim            <- default install location for vundle plugins
 |   |
 |   +-- bundle      <- vim plugins installed below this dir
 |
 +-- .vim.d          <- The root of our vim config
 |   |
 |   +-- conf.d      <- contains symlinks to 'parts'.  These parts form the
 |   |                  active configuration.
 |   |
 |   +-- parts.d     <- 'parts' fragments of vim config to be sourced by
 |   |   |              .vimrc
 |   |   |
 |   |   +-- plugins.vim <- Plugins are listed in here
 |   |   |
 |   |   +-- keymap.vim  <- Key bindings can be customised in here.
 |   |   |
 |   |   +-- <*>         <- other vim config fragments to be included
 |   |
 |   +-- helpers.d       <- fragments of viml with functions to assist the
 |   |                      loading of the config
 |   |
 |   +-- swap.d          <- swap file directory
 |   |
 |   +-- view.d          <- view file directory
 |   |
 |   +-- undo.d          <- undo file directory
 |   |
 |   +-- backup.d        <- backup file directory

```

`.vimrc` doesn't contain much.  It defines a few symbols to refer to the 
directories in `.vim.d/`, and it calls a helper function, defined in `helpers.d`,
to load the config fragments (parts) linked to from `conf.d`.



## Customization

To be explained.



# Plugins

mod-vim contains a curated set of popular vim plugins, colors, snippets and syntaxes. Great care has been made to ensure that these plugins play well together and have optimal configuration.

## Adding new plugins

Once new plugins are added, they have to be installed.

```bash
    vim +PluginInstall! +PluginClean +q
```

## Removing (disabling) an included plugin

* Keyboard [cheat sheet](https://walking-without-crutches.heroku.com/image/images/vi-vim-cheat-sheet.png).

[Git]:http://git-scm.com
[Vim]:http://www.vim.org/download.php#pc
[spf13-vim]:https://github.com/spf13/spf13-vim

