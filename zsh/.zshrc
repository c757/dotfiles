function proxy {
   proxy_host='127.0.0.1'
   proxy_port=7890
   http_proxy_url="http://$proxy_host:$proxy_port"
   socks5_proxy_url="socks5://$proxy_host:$proxy_port"
   export http_proxy=$http_proxy_url
   export HTTP_PROXY=$http_proxy_url
   export https_proxy=$http_proxy_url
   export HTTPS_PROXY=$http_proxy_url
   export all_proxy=$socks5_proxy_url
   export ALL_PROXY=$socks5_proxy_url
 }
function unproxy {
  unset http_proxy
  unset HTTP_PROXY
  unset https_proxy
  unset HTTPS_PROXY
  unset all_proxy
  unset ALL_PROXY
}

# Initialize starship prompt

eval "$(zoxide init zsh)"
source <(fzf --zsh)
eval "$(atuin init zsh)"
eval "$(starship init zsh)"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# nvm configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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
fastfetch
export PATH="/Library/TeX/texbin:$PATH"

alias ls='eza --icons=auto'
alias ll='eza -lah --icons=auto'
alias la='eza -a --icons=auto'
alias tree='eza --tree --level=2 --icons=auto'

export BAT_THEME="Dracula"
alias cat='bat --paging=never'