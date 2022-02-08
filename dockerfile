FROM debian
ENV SHELL /bin/bash

ADD . .
RUN chmod +x startup.sh

RUN apt -y update
RUN apt -y install docker
RUN apt -y install docker-compose
RUN apt -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt -y update
RUN apt -y install docker-ce docker-ce-cli containerd.io
RUN apt -y install sudo
RUN apt -y install iptables sudo -y

CMD ./startup.sh