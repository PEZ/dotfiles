
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

for al in `__git_aliases`; do
    alias g$al="git $al"

    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done



export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


alias emax=/Applications/Emacs.app/Contents/MacOS/Emacs


export DATOMIC_URI='datomic:mem://foo'
