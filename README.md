# wslSetup



1. make sure tmux & node (nvm!) & ctags are installed
2. install wsltty (https://github.com/mintty/wsltty/releases)
3. optional: solarized dark color scheme for mintty (https://github.com/mavnn/mintty-colors-solarized)
4. download and install caskaydiaCove NerdFont / NF (https://www.nerdfonts.com/font-downloads)
5. install nvim >= 0.5. (Download appimage and eg. `ln -s /home/foobar/.local/bin/nvim <path-to-appimage>`) 
6. install vim plug and place it in the nvim autoload folder (`curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`)
7. copy .tmux.conf and .config/nvim/init.vim to home directory
8. run `tmux source /home/foobar/.tmux.conf`
9. run nvim and do `:PlugInstall`

## Usage

- tmux
  - create session `tmux new -s sessionname`
  - tmux modifier is bound to ctrl+a
  - to detach `ctrl+a d`
  - to create pane `ctrl+a c`
  - to rename pane `ctrl+a ,`
  - to kill pane `ctrl+a x`
  - to go to next pane `ctrl+a Spacebar`, previous `ctrl+a Backspace`, to specific `ctrl+a number`
  - list sessions `tmux ls`
  - attach to session `tmux a -t sessionname`
  - kill session `tmux kill-session -t sessionname`
  - scroll `ctrl+a [` and then `k` or `ctrl u` for up and `j` or `ctrl d` for down, `gg` for top, `G` for bottom, `q` to quit scroll mode
- nvim
  - leader is spacebar
  - `jj` exit insert mode and save
  - split horizontal `:sp`, split vertical `:vsp`
  - navigate splits with `ctrl+w` and then `h or j or k or l`
  - find file `ctrl+p`
  - use vista finder `ctrl+o`
  - use vista tags `ctrl+t`
  - go to definition `gd`
  - go to type definition `gy`
  - go to implementation `gi`
  - go to reference `gr`
  - use `§` for terminal
  - use `ctrl+space` to trigger completion
  - press `K` to view documentation for symbol
  - rename symbol `rn`
  - apply quick fix for current line `space qf`
  - organize imports for current buffer `space i`
