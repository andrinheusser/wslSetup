# wslSetup



1. make sure tmux & node (nvm!) is installed
2. install wsltty (https://github.com/mintty/wsltty/releases)
3. optional: solarized dark color scheme for mintty (https://github.com/mavnn/mintty-colors-solarized)
4. download and install caskaydiaCove NerdFont / NF (https://www.nerdfonts.com/font-downloads)
5. install nvim >= 0.5. (Download appimage and eg. `ln -s /home/foobar/.local/bin/nvim <path-to-appimage>`) 
6. install vim plug and place it in the nvim autoload folder (`curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`)
7. copy .tmux.conf and .config/nvim/init.vim to home directory
8. run `tmux source /home/foobar/.tmux.conf`
9. run nvim and do `:PlugInstall`
