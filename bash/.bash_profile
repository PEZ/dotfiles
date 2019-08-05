
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
__GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias emax=/Applications/Emacs.app/Contents/MacOS/Emacs


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/petery/.sdkman"
[[ -s "/Users/petery/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/petery/.sdkman/bin/sdkman-init.sh"
# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Applications/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Applications/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Applications/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Applications/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
