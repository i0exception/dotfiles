PACKAGES="g++ python python-dev dstat htop cmake tmux fabric python-pip zsh"
GOLANG="https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz"
GOLANG_ARTIFACT="go1.6.2.linux-amd64.tar.gz"

install_packages() {
    for p in $(echo $PACKAGES | tr ' ' '\n'); do
        dpkg -s $p 2>&1 > /dev/null
        if [ $? -ne 0 ]; then
            sudo aptitude install $p
        fi
    done
}

install_packages

install_golang() {
    cd /tmp/
    wget --quiet -O $GOLANG_ARTIFACT $GOLANG
    sudo rm -f /usr/local/go
    sudo tar -C /usr/local -xzf $GOLANG_ARTIFACT
    rm $GOLANG_ARTIFACT

    mkdir -p $HOME/.gotools/src
    GOPATH=$HOME/.gotools /usr/local/go/bin/go get -u github.com/FiloSottile/gvt github.com/jteeuwen/go-bindata/... github.com/golang/lint/golint
}

install_golang

install_vimgo() {
    cd ~/.vim/bundle
    [[ -d vim-go ]] || git clone https://github.com/fatih/vim-go.git
    cd vim-go
    git pull origin master
}

install_vimgo

install_vim_ycm() {
    cd ~/.vim/bundle
    [[ -d YouCompleteMe ]] || git clone https://github.com/Valloric/YouCompleteMe.git
    cd YouCompleteMe
    git pull origin master
    git submodule update --init --recursive
    ./install.py --gocode-completer
}

install_vim_ycm

install_oh_my_zsh() {
    cd ~/
    [[ -d .oh-my-zsh ]] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cd ~/.oh-my-zsh
    git pull origin master
}

install_oh_my_zsh
