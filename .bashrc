# ~/.bashrc

if test -f /etc/profile.d/git-sdk.sh
then
    TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
    TITLEPREFIX=$MSYSTEM
fi

if test -f ~/.config/git/git-prompt.sh
then
    . ~/.config/git/git-prompt.sh
else
    PS1='\[\033]0;Terminal\007\]'  # title
    PS1="$PS1"'\[\033[32m\]'       # green arrow
    PS1="$PS1"'➜  '                # arrow symbo
    PS1="$PS1"'\[\033[36m\]'       #  directory color
    PS1="$PS1"'\[\e[1m\]\W\[\e[0m\]' #  directory bold


    if test -z "$WINELOADERNOEXEC"
    then
        GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
        COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
        COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
        COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
        if test -f "$COMPLETION_PATH/git-prompt.sh"
        then
            . "$COMPLETION_PATH/git-completion.bash"
            . "$COMPLETION_PATH/git-prompt.sh"
            PS1="$PS1"'\[\033[31m\]'  # git branch red
            PS1="$PS1"'`__git_ps1`'   # git branch
        fi
    fi

    PS1="$PS1"'\[\033[0m\]'
    PS1="$PS1"' '             
fi

MSYS2_PS1="$PS1" 

# alias 
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias npmi="npm install" 
alias home="cd ~"
alias c="clear"
alias clr="clear"
alias mkdir="mkdir -pv"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ls="ls --color=auto"
alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"
alias gs="git status"                   # Show git status
alias ga="git add"                      # Git add files
alias gaa="git add ."                   # Git add all files
alias gc="git commit -m"                # Git commit with message
alias gca="git commit --amend"          # Amend last commit
alias gp="git push"                     # Git push
alias gpf="git push --force"            # Force push (be careful with this!)
alias gl="git pull"                     # Git pull
alias gco="git checkout"                # Git checkout
alias gb="git branch"                   # List git branches
alias gba="git branch -a"               # List all git branches
alias gd="git diff"                     # Show git diff
alias gds="git diff --staged"           # Show git diff for staged files
alias gcl="git clone"                   # Git clone
alias gpl="git pull"                    # Git pull
alias gst="git stash"                   # Stash changes
alias gstp="git stash pop"              # Pop stash
alias gundo="git reset --soft HEAD~1"   # Undo last commit, keep changes
alias glog="git log --oneline --graph --all"  # Pretty git log graph
