# mod-vim : Jeff Lasslett's modular vim config
                             _
                            | |             
         _ __ ___   __   __ | |     __   __(_)_ __ ___
        | '_ ` _ \ /  \ /  `| |_____\ \ / /| | '_ ` _ \
        | | | | | | () | ()   |_____|\ V / | | | | | | |
        |_| |_| |_|\__/ \__'|_|       \_/  |_|_| |_| |_|
               

I'm not as ambitious as the author of SPF-13.  This is my personal vim config.
It works well for me on my macs and linux, but I've stripped out the windows
support (at least for now).  mod-vim achieves the same ends as spf-13 in that
it installs a set of useful plugins and provide some organisational philosophy 
to the configuration.

Unlike traditional VIM plugin structure, which similar to UNIX throws all files into common directories, making updating or disabling plugins a real mess, mod-vim uses the [Vundle] plugin management system to have a well organized vim directory (Similar to mac's app folders). Vundle also ensures that the latest versions of your plugins are installed and makes it easy to keep them up to date.

# Installation

## Linux, \*nix, Mac OSX Installation

The easiest way to install mod-vim is to use our [automatic installer](https://github.com/jefflasslett/mod-vim/blob/precious/bootstrap.sh) by simply copying and pasting the following line into a terminal. This will install mod-vim and backup your existing vim configuration. If you are upgrading from a prior version (before 3.0) this is also the recommended installation.

*Requires Git 1.7+ and Vim 7.3+*

```bash

    curl https://raw.githubusercontent.com/jefflasslett/mod-vim/precious/setup.sh -L > mod-vim.sh && sh mod-vim.sh
```

If you have a bash-compatible shell you can run the script directly:
```bash

    sh <(curl https://raw.githubusercontent.com/jefflasslett/mod-vim/precious/bootstrap.sh -L)
```

The .vimrc file is suited to programming. It has bugger all in it.  Instead 'parts' are to be found in as 'parts.d' directory, and included in the config by symlinking the desired parts into a conf.d dir.

It fixes many of the inconveniences of vanilla vim including

 * A single config can be used across Mac and linux
 * Eliminates swap and backup files from littering directories, preferring to store in a central location.
 * Fixes common typos like :W, :Q, etc
 * Setup a solid set of settings for Formatting (change to meet your needs)
 * Setup the interface to take advantage of vim's features including
   * omnicomplete
   * line numbers
   * syntax highlighting
   * A better ruler & status line
   * & more
 * Configuring included plugins

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

Add the UnBundle command to this line. It takes the same input as the Bundle line, so simply copy the line you want to disable and add 'Un' to the beginning.

For example, disabling the 'AutoClose' and 'scrooloose/syntastic' plugins

```bash
    echo UnBundle \'AutoClose\' >> ~/.vimrc.local
    echo UnBundle \'scrooloose/syntastic\' >> ~/.vimrc.local
```

**Remember to run ':PluginClean!' after this to remove the existing directories**


Here are a few of the plugins:


## [NERDTree]

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim editing.  You can learn more about it with
:help NERDTree.

**QuickStart** Launch using `<Leader>e`.

**Customizations**:

* Use `<C-E>` to toggle NERDTree
* Use `<leader>e` or `<leader>nt` to load NERDTreeFind which opens NERDTree where the current file is located.
* Hide clutter ('\.pyc', '\.git', '\.hg', '\.svn', '\.bzr')
* Treat NERDTree more like a panel than a split.

## [Syntastic]

Syntastic is a syntax checking plugin that runs buffers through external syntax
checkers as they are saved and opened. If syntax errors are detected, the user
is notified and is happy because they didn't have to compile their code or
execute their script to find them.

## [Fugitive]

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or
unstage it. Type `p` on a file to enter `git add -p` and stage specific
hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that
file

**QuickStart** `<leader>gs` to bring up git status

**Customizations**:

 * `<leader>gs` :Gstatus<CR>
 * `<leader>gd` :Gdiff<CR>
 * `<leader>gc` :Gcommit<CR>
 * `<leader>gb` :Gblame<CR>
 * `<leader>gl` :Glog<CR>
 * `<leader>gp` :Git push<CR>
 * `<leader>gw` :Gwrite<CR>
 * :Git ___ will pass anything along to git.

![fugitive image][fugitive-img]

## [Tabularize]

Tabularize lets you align statements on their equal signs and other characters

**Customizations**:

 * `<Leader>a= :Tabularize /=<CR>`
 * `<Leader>a: :Tabularize /:<CR>`
 * `<Leader>a:: :Tabularize /:\zs<CR>`
 * `<Leader>a, :Tabularize /,<CR>`
 * `<Leader>a<Bar> :Tabularize /<Bar><CR>`

## [Airline]

Airline provides a lightweight themable statusline with no external dependencies. By default this configuration uses the symbols `‹` and `›` as separators for different statusline sections but can be configured to use the same symbols as [Powerline]. An example first without and then with powerline symbols is shown here:

![airline image][airline-img]

To enable powerline symbols first install one of the [Powerline Fonts] or patch your favorite font using the provided instructions. Configure your terminal, MacVim, or Gvim to use the desired font. Finally add `let g:airline_powerline_fonts=1` to your `.vimrc.before.local`.

## Additional Syntaxes

mod-vim ships with a few additional syntaxes:

* Markdown (bound to \*.markdown, \*.md, and \*.mk)
* Twig
* Git commits (set your `EDITOR` to `mvim -f`)


# Intro to VIM

Here's some tips if you've never used VIM before:

## Tutorials

* Type `vimtutor` into a shell to go through a brief interactive
  tutorial inside VIM.
* Read the slides at [VIM: Walking Without Crutches](https://walking-without-crutches.heroku.com/#1).

## Modes

* VIM has two (common) modes:
  * insert mode- stuff you type is added to the buffer
  * normal mode- keys you hit are interpreted as commands
* To enter insert mode, hit `i`
* To exit insert mode, hit `<ESC>`

## Useful commands

* Use `:q` to exit vim
* Certain commands are prefixed with a `<Leader>` key, which by default maps to `\`.
  Spf13-vim uses `let mapleader = ","` to change this to `,` which is in a consistent and
  convenient location.
* Keyboard [cheat sheet](https://walking-without-crutches.heroku.com/image/images/vi-vim-cheat-sheet.png).

[Git]:http://git-scm.com
[Curl]:http://curl.haxx.se
[Vim]:http://www.vim.org/download.php#pc
[msysgit]:http://code.google.com/p/msysgit
[Chocolatey]: http://chocolatey.org/
[MacVim]:http://code.google.com/p/macvim/
[spf13-vim]:https://github.com/spf13/spf13-vim
[contributors]:https://github.com/spf13/spf13-vim/contributors

[Vundle]:https://github.com/gmarik/vundle
[NERDCommenter]:https://github.com/scrooloose/nerdcommenter
[Undotree]:https://github.com/mbbill/undotree
[NERDTree]:https://github.com/scrooloose/nerdtree
[ctrlp]:https://github.com/kien/ctrlp.vim
[solarized]:https://github.com/altercation/vim-colors-solarized
[neocomplcache]:https://github.com/shougo/neocomplcache
[Fugitive]:https://github.com/tpope/vim-fugitive
[Surround]:https://github.com/tpope/vim-surround
[Tagbar]:https://github.com/majutsushi/tagbar
[Syntastic]:https://github.com/scrooloose/syntastic
[vim-easymotion]:https://github.com/Lokaltog/vim-easymotion
[YouCompleteMe]:https://github.com/Valloric/YouCompleteMe
[Matchit]:http://www.vim.org/scripts/script.php?script_id=39
[Tabularize]:https://github.com/godlygeek/tabular
[EasyMotion]:https://github.com/Lokaltog/vim-easymotion
[Airline]:https://github.com/bling/vim-airline
[Powerline]:https://github.com/lokaltog/powerline
[Powerline Fonts]:https://github.com/Lokaltog/powerline-fonts

[autocomplete-img]:https://i.imgur.com/90Gg7.png
[tagbar-img]:https://i.imgur.com/cjbrC.png
[fugitive-img]:https://i.imgur.com/4NrxV.png
[nerdtree-img]:https://i.imgur.com/9xIfu.png
[phpmanual-img]:https://i.imgur.com/c0GGP.png
[easymotion-img]:https://i.imgur.com/ZsrVL.png
[airline-img]:https://i.imgur.com/D4ZYADr.png
