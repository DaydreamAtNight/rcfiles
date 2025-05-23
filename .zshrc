# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/lsongrui/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git cp extract rand-quote)

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# >>> brew >>>
export PATH="/opt/homebrew/bin:/Library/Frameworks/Python.framework/Versions/3.9/bin:/usr/local/bin:/usr/local/bin/sublime:/usr/bin:/bin:/usr/sbin:/sbin"
alias abrew="/opt/homebrew/bin/brew" # ARM Homebrew

export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=1

# <<< brew <<<

# >>> docker initialize >>>
# useful only for Mac OS Silicon M1,
# still working but useless for the other platforms
docker() {
 if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
    /usr/local/bin/docker "$1" --platform linux/amd64 "${@:2}"
  else
     /usr/local/bin/docker "$@"
  fi
}
# <<< docker initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> user input alias >>>
alias idle="idle3"
alias ..="cd .."
alias ...="cd ../.."
alias l="ls -a"
alias ll="la -a"
alias cp="cpv"
alias py="python3"
alias ]="open"
alias so="source ~/.zshrc "
alias teamviewer="open /Applications/TeamViewer.app "
alias paraview="open /Applications/ParaView-5.10.1.app"
alias s="open -a /Applications/Sublime\ Text.app"
alias c="code"
alias typora="open -a typora"
alias b="cd ~/Documents/2_files/self_blog"
alias lsr="cd ~/Documents"
alias sudo="sudo -p \"\$(cowsay -f tux \'If you know the password, enter it here. Or just go away:\')\""
alias cls="clear"
alias git-switch="~/rcfiles/git-switch.sh"
alias youtube-dl="yt-dlp"
alias gmsh="/Applications/Gmsh.app/Contents/MacOS/gmsh"
# alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | awk "{print \$2}"'
alias ip='ipconfig getifaddr en0'

eval $(thefuck --alias)


# trash()  
# {  
#    mv $@ ~/.Trash/
# }  
# alias trash='trash'
self_blog_submit()  
{  
   hexo g
   hexo d
   git add --all
   git commit -m 'blog update'
   hexo s
}  
alias blog='self_blog_submit'
#alias pyinstaller="/opt/homebrew/Caskroom/miniforge/base/bin/pyinstaller"
#
#alias youtube-dl="/opt/homebrew/bin/youtube-dl"
#
#alias of="source /Volumes/OpenFOAMs/OpenFOAM-v2112/etc/bashrc"
#
# <<< user input alias <<<


# >>> paths
export PATH="/Users/lsongrui/Library/Python/3.9/bin:$PATH"

#
#export PATH="/opt/homebrew/Cellar/qt@5/5.15.2/bin:$PATH"
#export PATH="/opt/homebrew/Cellar/pyqt@5/5.15.4_2/bin:$PATH"
#export PATH="/opt/homebrew/Cellar/pyqt/6.1.1/bin:$PATH"
#export PATH="/opt/homebrew/opt/pyside@2/bin/:$PATH"

# export LIBRARY_PATH=$LIBRARY_PATH:"/opt/homebrew/Caskroom/miniforge/base/lib"

#export PYTHONPATH=$PYTHONPATH:/opt/homebrew/opt/pyside@2/lib/python3.9/site-packages/

#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottlesexport PATH="/opt/homebrew/sbin:$PATH"

# <<< paths

# neofetch --ascii "$(fortune -s | cowsay -f happy-whale -W 30)" | lolcat
# neofetch --ascii "$(fortune -s | cowsay -r -W 30)" | lolcat
neofetch --ascii "$(fortune -s | cowsay -f `ls /opt/homebrew/Cellar/cowsay/3.04_1/share/cows | sed 's/\.cow//' | sort -R | head -1`)" | lolcat
# asciiquarium

