
                                       .o8                       o8o                    
                                      "888                       `"'                    
     ooo. .oo.  .oo.    .ooooo.   .oooo888          oooo    ooo oooo  ooo. .oo.  .oo.   
     `888P"Y88bP"Y88b  d88' `88b d88' `888           `88.  .8'  `888  `888P"Y88bP"Y88b  
      888   888   888  888   888 888   888  8888888   `88..8'    888   888   888   888  
      888   888   888  888   888 888   888             `888'     888   888   888   888  
     o888o o888o o888o `Y8bod8P' `Y8bod88P"             `8'     o888o o888o o888o o888o 
                                                                                   
                                                                                   


# mod-vim : a modular vim config

This is my vim config. It started out as spf-13 (Steve Francia's) vimrc.  But
things got out of hand and spf-13 had to be gutted.  Also, I found my vim
sessions could get a biiiitt   slloooooow.

So in the words of the rogue marine to Nick Cage in "The Rock":
> "I'll take pleasure in guttin' you boy!"

It works well for me on my macs and linux, but I've
stripped out the windows support (at least for now).  mod-vim achieves the same
ends as spf-13 in that it installs a set of useful plugins and provides some
organisational philosophy to the configuration.


# Installation

Nothing fancy as yet.  Simply clone this project somewhere convenient and
create symlinks:

## vim

1. `ln -s path/to/mod-vim/vimrc ~/.vimrc`
1. `ln -s path/to/mod-vim/vim.d ~/.vim.d`
1. Install vundle.  See install details at [https://github.com/VundleVim/Vundle.vim]
1. `vim +PluginInstall! +PluginClean +qall`

## neovim

I'm now using [neovim](http://neovim.io) and, provided you install neovim's python support, this
config and its plugins work.

Neovim puts its rc file in a different place to vim.
See [:help nvim-from-vim](https://neovim.io/doc/user/nvim_from_vim.html)

Also [:help nvim-configuration](https://neovim.io/doc/user/nvim_configuration.html)

The [XDG spec](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html)
indicates that the default for `$XDG_CONFIG_HOME` is `$HOME/.config`.  neovim will look
for its config at `$HOME/.config/nvim` if `$XDG_CONFIG_HOME` is not set.

Assuming `$XDG_CONFIG_HOME` is set ...
> Use `$XDG_CONFIG_HOME/nvim/init.vim` instead of `.vimrc` for storing configuration.

Make `$XDG_CONFIG_HOME/nvim/init.vim` a symlink to `mod-vim`'s `vimrc` file:

`> ln -s /path/to/mod-vim/vimrc $XDG_CONFIG_HOME/nvim/init.vim`

Currently the config is setup to install plugins into `$HOME/.vim`.  This
should be OK but if it isn't please let me know.  FWIW, as a former vim user, I
followed the steps in [:help nvim-from-vim](https://neovim.io/doc/user/nvim_from_vim.html)


### To setup neovim's python package

From [:help nvim-python](https://neovim.io/doc/user/nvim_python.html#nvim-python)

> To use Vim Python 2/3 plugins with Nvim, do the following:
>
> - For Python 2 plugins, make sure an interpreter for Python 2.6 or 2.7 is
>   available in your `$PATH`, then install the `neovim` Python package systemwide:
>
>     $ sudo pip2 install neovim
>
>   or for the current user:
>
>     $ pip2 install --user neovim
>
> - For Python 3 plugins, make sure an interpreter for Python 3.3 or above is
>   available in your `$PATH`, then install the `neovim` Python package systemwide:
>
>     $ sudo pip3 install neovim
>
>   or for the current user:
>
>     $ pip3 install --user neovim



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

SPF-13 installs a fairly massive number of plugins, and the functionality of
some seem to overlap.  I found that you really need to study each plugin and its
keybindings to really get the best out of it (surprise).

It dawned on me that it would probably be best to build my own config and install
only the plugins that I use.  Secondly, I would only install one plugin at a
time, set its key bindings, and learn how to make effective use of it.

With that in mind here's what is installed:

<dl>
  <dt>'gmarik/Vundle.vim'</dt>
  <dd>the plugin manager</dd>
  <dt>'jefflasslett/coding_goodness'</dt>
  <dd>my own syntax highlighting<dd>
  <dt>'scrooloose/nerdtree'</dt>
  <dd>project tree view<dd>
  <dt>'Shougo/vimproc'</dt>
  <dd>prerequisite for Shuogo's other plugins<dd>
  <dt>'kien/ctrlp.vim'</dt>
  <dd>fuzzy finder and lister of files/buffers<dd>
  <dt>'tpope/vim-fugitive'</dt>
  <dd>git wrapper<dd>
  <dt>'rking/ag.vim'</dt>
  <dd>regexp file search<dd>
  <dt>'scrooloose/syntastic'</dt>
  <dd>syntax checker<dd>
  <dt>'Twinside/vim-haskellConceal</dt>
  <dd>replaces peices of haskell syntax with unicode chars<dd>
  <dt>'eagletmt/ghcmod-vim'</dt>
  <dd>calls ghc on modules of haskell code.  Provides fantastic guidance.<dd>
  <dt>'eagletmt/neco-ghc'<dt>
  <dd>Autocompletion for Haskell code</dd>
  <dt>'Twinside/vim-hoogle'</dt>
  <dd>Haskell library search<dd>
  <dt>'pbrisbin/html-template-syntax'</dt>
  <dd>Yesod templates<dd>
  <dt>'bling/vim-airline'</dt>
  <dd>Enhanced status line<dd>
  <dt>'Valloric/YouCompleteMe'</dt>
  <dd>Code completion<dd>
  <dt>'mattn/emmet-vim'</dt>
  <dd>HTML editing <dd>
  <dt>'groenewege/vim-less'</dt>
  <dd>Syntax highlighting of Less CSS preprocessor syntax</dd>
  <dt>'tpope/vim-rails'</dt>
  <dd>Rails project navigation and helpers</dd>
  <dt>'tpope/vim-bundler'</dt>
  <dd>"Lightweight bag of goodies for bundler.  Works well with rails.vim</dd>
  <dt>'slim-template/vim-slim'</dt>
  <dd>Syntax highlighting for slim templates</dd>
  <dt>'kchmck/vim-coffee-script'</dt>
  <dd>Syntax highlighting for coffeescript files</dd>
</dl>



## Adding and removing new plugins

Just edit the list in `vim.d/parts.d/plugins.vim` and run:
```bash
    vim +PluginInstall! +PluginClean +q
```

There may also be custom key bindings to alter and other fragments of config
to edit.  

**More to come.**

[Git]:http://git-scm.com
[Vim]:http://www.vim.org/download.php#pc
[spf13-vim]:https://github.com/spf13/spf13-vim

