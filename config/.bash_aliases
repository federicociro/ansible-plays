# Common aliases
alias la='LS_COLORS="mh=1;37" ls -A'
alias l='LS_COLORS="mh=1;37" ls -CF'
alias ll='LC_COLLATE=C LS_COLORS="mh=1;37" ls -la --si --group-directories-first'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias nano='nano -lS'
alias ss='systemctl status'

# Nginx aliases
alias nt='nginx -t'
alias nr='systemctl reload nginx'

# Net tools
alias ports='netstat -tulpn'

# Docker Aliases
alias d='docker'
alias di='docker images'
alias dps='docker ps'
alias dpa='docker ps -a'
alias dl='docker logs'
alias drm='docker rm'
alias drmi='docker rmi'
alias dexec='docker exec -it'
alias dstop='docker stop'
alias drun='docker run'

# Docker Compose Aliases
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcd='docker-compose down'
alias dcps='docker-compose ps'
alias dclogs='docker-compose logs'
alias dcrestart='docker-compose restart'
