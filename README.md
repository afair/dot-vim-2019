# Allen's 2019 .vim configuration

Install dependencies (or disable the related plugins later):

* node.js
* solargraph gem   

To install, issue these commands:

    cd
    git clone git@github.com:afair/dot-vim-2019.git .vim
    ln -s .vim/vimrc .vimrc
    
Alternatively, there is a vimrc-lite file with fewer plugins enable, useful for servers instead of development environments.

    ln -s .vim/vimrc-lite .vimrc
    
To use to Neovim, edit, create this file:

    mkdir -p .config/nvim
    vim .config/nvim/init.vim

To that file, add:

    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc

Then install the plugins

    vim .vimrc

Disable any plugins you don't need. Add any others you do.

    :PlugUpgrade
    :PlugInstall
    
Exit vim and restart editing your application!    
    
Share and Enjoy!  
