#!/bin/sh
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
set +o noglob

usage=$'
Please set --with_nettool if needs use netstat.
Please set --with_docker if needs use docker in develop container
Please set --with_zsh if needs use zsh shell. '

#
with_nettool=$false
#
with_docker=$false
#
with_zsh=$false

offset=1

while [ $# -gt 0 ]; do
    case "$1" in
    --help)
        echo "$usage"
        exit 0
        ;;
    -n | --with_nettool)
        if [ ! -z $2 ]; then
            with_nettool=$2
            offset=2
        else
            with_nettool=$true
            offset=1
        fi
        ;;

    -d | --with_docker)
        if [ ! -z "$2" ]; then
            with_docker=$2
            offset=2
        else
            with_docker=$true
            offset=1
        fi
        ;;

    -z | --with_zsh)
        if [ ! -z $2 ]; then
            with_zsh=$2
            offset=2
        else
            with_zsh=$true
            offset=1
        fi
        ;;

    --)
        shift offset
        break
        ;;

        # * )  echo "$usage"; exit 1;;

    esac
    shift || true
done

echo "with_nettool:[ $with_nettool ] || with_docker:[ $with_docker ] || with_zsh:[ $with_zsh ]"


if [ $with_nettool ] || [ $with_docker ] || [ $with_zsh ]; then

    ## update apt-get and installl dependency packages

    apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        lxc \
        iptables \
        gnupg \
        lsb-release

    if [ $with_nettool ]; then
        echo "install nettool ......"
        apt-get update && apt-get install -y net-tools
    fi

    if [ $with_zsh ]; then
        echo "install zsh ......"
        ./zsh-in-docker.sh \
            -t https://github.com/denysdovhan/spaceship-prompt \
            -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
            -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
            -p git \
            -p https://github.com/zsh-users/zsh-autosuggestions \
            -p https://github.com/zsh-users/zsh-completions \
            -p https://github.com/zsh-users/zsh-history-substring-search \
            -p https://github.com/zsh-users/zsh-syntax-highlighting \
            -p 'history-substring-search' \
            -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
            -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down'

        chsh -s /bin/zsh &&
            git clone https://github.com/caiogondim/bullet-train.zsh.git &&
            mv ./bullet-train.zsh/bullet-train.zsh-theme ~/.oh-my-zsh/themes &&
            sed -i -r 's/ZSH_THEME=.*/ZSH_THEME="bullet-train"/' ~/.zshrc
    fi

    # 安裝 DOCKER 請參考 Docker in Docker 專案 https://github.com/jpetazzo/dind/blob/master/Dockerfile
    if [ $with_docker ]; then
        echo "install docker ......";
        ./docker-install.sh;
        echo "install docker-compose ......"
        curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
            chmod +x /usr/local/bin/docker-compose &&
            ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    fi
fi
