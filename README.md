# Dotfiles

Basic install of all dotfiles:

```
export DOTFILES_DIR=/path/to/dotfiles
ln -s $DOTFILES_DIR/gitconfig.symlink $HOME/.gitconfig
ln -s $DOTFILES_DIR/tmux.conf.symlink $HOME/.tmux.conf
ln -s $DOTFILES_DIR/zshrc.symlink $HOME/.zshrc
touch $HOME/.zshrc.alias
mkdir $HOME/.zshfunctions
ln -s $DOTFILES_DIR/prompt_bshourd_setup.symlink $HOME/.zshfunctions/prompt_bshourd_setup
mkdir $HOME/.xmonad
ln -s $DOTFILES_DIR/xmonad.hs.symlink $HOME/.xmonad/xmonad.hs
mkdir -p $HOME/.config/nvim
ln -s $DOTFILES_DIR/nvim-init.vim.symlink $HOME/.config/nvim/init.vim
# For st, copy over relevant parts of st-config.h into config.h
```

## Requirements

Need `zsh`, `git`, `tmux`, `xmonad`, `st`, and `nvim`, of course.

### nvim

* Relies on [vim-plug](https://github.com/junegunn/vim-plug) to install plugins.
    This will need to be installed first
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) requires some
    additional installation after the plugin is downloaded
* If writing `scala`, might want to uncomment `ensime` config and `neoformat`
    config, both of which require external tools

### zsh

* Relies on [GNU
    src-highlite](https://www.gnu.org/software/src-highlite/source-highlight.html#Download)
    for source highlighting in less. This can easily be commented out from the
    zshconfig.
* Relies on [hstr](https://github.com/dvorka/hstr) (the `hh` command) for
    history binding. Also can easily be commented out.
* There is some configuration assuming that
    [nvm](https://github.com/creationix/nvm) is installed to manage node.

### st

* The font configured is [Hack](https://sourcefoundry.org/hack/), which will
    need to be installed in order to be used, or else choose another font

### xmonad

* There is a keyboard shortcut to launch
    [dmenu](https://tools.suckless.org/dmenu/), so install that if you think
    that it will be needed.
