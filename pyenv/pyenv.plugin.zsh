FOUND_PYENV=0

export PYENV_ROOT="$HOME/.pyenv"

eval "$(pyenv init - zsh)"

if pyenv commands | command grep -q virtualenv-init; then
    eval "$(pyenv virtualenv-init - zsh)"
fi

function pyenv_prompt_info() {
    echo "$(pyenv version-name)"
}

if [ $FOUND_PYENV -eq 0 ] ; then
    function pyenv_prompt_info() { echo "system: $(python -V 2>&1 | cut -f 2 -d ' ')" }
fi
