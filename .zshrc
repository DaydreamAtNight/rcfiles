# --------------------------------------------------------------------------- #
# Initialization & Plugins
# --------------------------------------------------------------------------- #
# # >>> docker initialize >>>
# # useful only for Mac OS Silicon M1,
# # still working but useless for the other platforms
# docker() {
#  if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
#     /usr/local/bin/docker "$1" --platform linux/amd64 "${@:2}"
#   else
#      /usr/local/bin/docker "$@"
#   fi
# }
# # <<< docker initialize <<<

# >>> conda initialize >>>
# export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"  # commented out by conda initialize
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> oh my zsh initialize>>>
export ZSH="/Users/lsongrui/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# List of Oh My Zsh plugins to load.
plugins=(
    git
    cp
    extract
    rand-quote
)
source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# <<< oh my zsh initialize<<<

# --------------------------------------------------------------------------- #
# Environment Variables & PATH
# --------------------------------------------------------------------------- #
typeset -U path
path=(
    /opt/homebrew/bin
    /Users/lsongrui/Library/Python/3.9/bin
    /Library/Frameworks/Python.framework/Versions/3.9/bin
    /Applications/FEBioStudio/FEBioStudio.app/Contents/MacOS
    $path
)

# # >>> brew >>>
export HOMEBREW_NO_AUTO_UPDATE=1
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottlesexport PATH="/opt/homebrew/sbin:$PATH"
# # <<< brew <<<

# --------------------------------------------------------------------------- #
# Aliases
# --------------------------------------------------------------------------- #
## General & System
alias ..="cd .."
alias ...="cd ../.."
alias l="ls -a"
alias ll="ls -la" # Changed `la -a` to `ls -la` for correctness
alias cp="cpv" # `cpv` is a verbose `cp` from the 'cp' plugin
alias cls="clear"
alias so="source ~/.zshrc"
alias sudo="sudo -p \"\$(cowsay -f tux \'If you know the password, enter it here. Or just go away:\')\""
# alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | awk "{print \$2}"'
alias ip='ipconfig getifaddr en0'
alias cleanDS='find . -name ".DS_Store" -delete'

## Navigation
alias b="cd ~/Documents/2_files/self_blog"
alias lsr="cd ~/Documents"
alias phd="cd /Users/lsongrui/Library/CloudStorage/OneDrive-Vanderbilt/1_documents/PHD"

## Applications
alias py="python3"
alias ]="open"
alias typora="open -a typora"
alias paraview="open /Applications/ParaView-5.10.1.app"
alias blender="/Applications/Blender.app/Contents/MacOS/Blender"

## Tools & Git
alias youtube-dl="yt-dlp"
alias abrew="/opt/homebrew/bin/brew" # ARM Homebrew
alias git-switch="~/rcfiles/git-switch.sh"
eval $(thefuck --alias)

# --------------------------------------------------------------------------- #
# Functions
# --------------------------------------------------------------------------- #
# Generate, deploy, and commit a Hexo blog update.
self_blog_submit() {
   hexo g
   hexo d
   git add --all
   git commit -m 'blog update'
   hexo s
}
alias blog='self_blog_submit'

# --------------------------------------------------------------------------- #
# Startup Commands
# --------------------------------------------------------------------------- #
neofetch --ascii "$(fortune -s | cowsay -f $(find /opt/homebrew/Cellar/cowsay/3.04_1/share/cows -name '*.cow' -exec basename {} .cow \; | sort -R | head -1))" | lolcat
# asciiquarium

