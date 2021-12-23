
# Global ARGs
ARG ANGULAR_CLI_VER="13.0.1"
ARG ENABLE_NETTOOL=false
ARG ENABLE_ZSH=false
ARG ENABLE_DOCKER=false

FROM willh/ngcli:${ANGULAR_CLI_VER}


ARG ENABLE_NETTOOL
ARG ENABLE_ZSH
ARG ENABLE_DOCKER

COPY ./scripts ./scripts

RUN chmod 755 ./scripts/*.sh 

RUN ls -alFh ./scripts
RUN cd ./scripts && ./option-install.sh  --with_nettool  ${ENABLE_NETTOOL}  --with_docker ${ENABLE_DOCKER}  --with_zsh ${ENABLE_ZSH} 
# RUN rm -rf ./scripts

VOLUME /var/lib/docker
EXPOSE 4200
##===================================================================================================================================


