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

RUN git clone https://github.com/NataleMarco/nvim.git ~/.config/nvim
RUN git clone https://github.com/Marcos126/biblioteca.git /home/devEnv/biblioteca

ENTRYPOINT [ "nvim", "." ]
