![dotfiles](dotfiles.png)

## I don't care if Monday's blue!

### 1. [homebrew](https://brew.sh) or [linuxbrew](http://linuxbrew.sh)
```
# install the homebrew, then get your favourite tools
brew install zsh neovim tmux ranger tig fd the_silver_searcher
```

### 2. bash and terminal [color theme](https://github.com/typedivision/division)
```
# get base16-shell scripts
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# get config
cp --parents .config/base16-shell/scripts/base16-division.sh ~

# bash config (zsh follows next)
cat .bashrc >> ~/.bashrc

# restart bash and set color theme (or wait for zsh setup)
base16_division
```

.o( for `cp --parents` in macOS, you need to `brew install coreutils` and then there is `gcp`)

### 3. zsh with [prezto](https://github.com/sorin-ionescu/prezto)
```
# follow prezto instructions to have all dotfiles initialized, then
cp .zshrc .zpreztorc ~
cp --parents .zprezto/modules/completion/init.zsh ~
cp --parents .zprezto/modules/prompt/functions/prompt_damoekri_setup ~
```

.o( here as well: add coreutils and gnu-sed and prefix g (gsed, gdircolors) in .zshrc for macOS )  
.o( with zprezto, gcp is a git alias, uncomment git "Disable aliases" line in .zpreztorc to fix )

### 4. tmux and [plugins](https://github.com/tmux-plugins/tpm)
```
# install plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# get config
cp .tmux.conf ~

# then start tmux and install plugins by <ctrl> a + I
# and get color theme
cp --parents .tmux/plugins/base16-tmux/tmuxcolors-division.conf ~
```

### 5. neovim and [plugins](https://github.com/junegunn/vim-plug)
```
# install powerline fonts
sudo apt-get install fonts-powerline

# install plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# get config
mkdir ~/.config/nvim
cp --parents .config/nvim/init.vim ~

# then start nvim, ignore errors and install plugins by :PlugInstall
# then get color theme
cp --parents .local/share/nvim/plugged/base16-vim/colors/base16-division.vim ~
```

### Others
```
cp --parents .config/ranger/rc.conf ~
```

### Updates
```
# homebrew
brew update
brew upgrade

# prezto
cd ~/.zprezto
git stash
zprezto-update
git stash pop

# tmux plugins
<ctrl> a + U

# nvim plugins
:PlugUpdate
```
