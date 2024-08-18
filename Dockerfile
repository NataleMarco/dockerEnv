FROM archlinux:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN pacman -Syy && pacman -Sy --noconfirm \
		zsh\
		neovim\
		git\
		lua51\
		unzip\
		zip\
		npm\
		go\
		gcc

WORKDIR /home/devEnv/

RUN curl -s "https://get.sdkman.io" | bash
