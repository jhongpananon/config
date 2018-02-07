if [ -f ~/.bash_aliases_egg ]; then . ~/.bash_aliases_egg; fi

export PATH=$PATH:$HOME/cmake-3.10.2-Linux-x86_64/bin

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
