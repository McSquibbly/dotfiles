#!/bin/bash

function update_dot() {
    local force=$1
    cd $HOME/.dot
    if [[ -n $force ]]; then
        update_git_completion
    fi
    git pull --rebase > /dev/null
    copyDotFiles
    source activate
    cd -
}

function checkmesoshc() {
    local h=$1
    if [[ -z $h ]]; then
        h=$(hostname)
    fi
    local r=$(curl -w "%{http_code}" -s "$h:5051/slave(1)/health" -o /dev/null)
    if [[ $r == "200" ]]; then
        echo "$h is ok"
    else
        echo "$h is not ok"
    fi
}

function copyDotFiles() {
    cp tmux.conf $HOME/.tmux.conf
    cp vimrc $HOME/.vimrc
    cp gitconfig $HOME/.gitconfig
    cp git-completion.bash $HOME/.git-completion.bash
}

function update_git_completion() {
    curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o git-completion.bash
}
