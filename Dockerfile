FROM rust:1.61

WORKDIR /home/app

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list and install dependencies
RUN apt-get update \
    && apt-get install -y curl \
    libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev \
    && apt-get -y autoclean

# nvm environment variables
RUN mkdir /root/nvm
ENV NVM_DIR /root/nvm
ENV NODE_VERSION 16.15.1

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v
RUN cargo -v



