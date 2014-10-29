FROM ubuntu
MAINTAINER Jeremy White <dudymas@gmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

RUN apt-get update && apt-get upgrade -y ;\
    apt-get install nodejs npm git python build-essential wget screen tmux curl vim mongodb-org -y; \
    apt-get clean;\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;\
    mkdir /data; \
    mkdir /data/db; \
    mkdir /app

WORKDIR /app

RUN npm install -g bower grunt-cli yo generator-meanjs express

# RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

EXPOSE 80:80
EXPOSE 443:443
EXPOSE 3000:3000

ENTRYPOINT echo "\n##############################\n1. 'yo meanjs' to scaffold your app in the current directory.\n3. Start mongo in the background (e.g. 'mongod &')\n##############################\n"

