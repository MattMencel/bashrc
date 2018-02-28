# iTerm2 Shell Integration
source ~/.iterm2_shell_integration.`basename $SHELL`

# Sensible Bash Defaults: https://github.com/mrzool/bash-sensible
if [ -f ~/bin/sensible.bash ]; then
   source ~/bin/sensible.bash
fi

# CHEF
eval "$(chef shell-init bash)"


### EXPORTS
# docker integration
#export DOCKER_HOST=tcp://192.168.99.100:2376
#export DOCKER_CERT_PATH=/Users/mmencel/.docker/machine/machines/default
#export DOCKER_TLS_VERIFY=1

# GO
export GOPATH=~/go
export PATH=/usr/local/sbin:~/bin:$GOPATH/bin:$PATH

# KUBECONFIG
export KUBECONFIG=/Users/mmencel/.kube/config:/Users/mmencel/.kube/config.test

# PHPCS
export PATH="$(brew --prefix php72)/bin:$PATH"

# VI
export EDITOR=vi

### ALIASES

### BASH COMPLETION (http://davidalger.com/development/bash-completion-on-os-x-with-brew/)
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


source <(kubectl completion bash)

### POWERLINE-GO
function _update_ps1() {
    PS1="$(~/go/bin/powerline-go -colorize-hostname -newline -error $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
