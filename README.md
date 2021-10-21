# wslSetup



1. make sure tmux & node (nvm!) is installed
2. install nvim >= 0.5. (Download appimage and eg. `ln -s /home/foobar/.local/bin/nvim <path-to-appimage>`) 
3. install vim plug and place it in the nvim autoload folder (`curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`)
4. copy .tmux.conf and .config/nvim/init.vim to home directory
5. run nvim and do `:PlugInstall`
