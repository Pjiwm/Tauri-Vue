FROM ubuntu:latest
RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app


RUN apt update -y 

RUN apt install curl -y

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Required dependencies for Tauri
RUN apt install libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    libssl-dev \
    libgtk-3-dev \
    libappindicator3-dev \
    librsvg2-dev -y

# Install NodeJS
RUN apt install nodejs npm -y


# Install Tauri CLI and Vue CLI
RUN npm install -g @vue/cli
RUN npm install -g @tauri-apps/cli

# user
RUN apt-get -y install sudo
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN chown -R docker /usr/src/app
USER docker