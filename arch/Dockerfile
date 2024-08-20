FROM archlinux:latest

EXPOSE 22

VOLUME /home/developer/proyecto

RUN pacman -Syy && pacman -Sy --noconfirm \
		zsh\
		neovim\
		git\
		lua51\
		unzip\
		zip\
		npm\
		go\
		gcc\
		ripgrep\
		openssh\
		xclip\
		xorg-xauth



RUN useradd -m developer && \
    echo 'developer:1234' | chpasswd

RUN echo '/bin/zsh' | chsh developer

RUN ssh-keygen -b 2048 -t rsa -N "" -A && \
		sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo 'X11Forwarding yes' >> /etc/ssh/sshd_config && \
    echo 'X11UseLocalhost no' >> /etc/ssh/sshd_config

USER developer 

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN curl -s "https://get.sdkman.io" | bash

RUN source ~/.sdkman/bin/sdkman-init.sh && sdk install maven 

RUN source ~/.sdkman/bin/sdkman-init.sh && sdk install java 17.0.12-oracle

RUN git clone https://github.com/NataleMarco/nvim.git ~/.config/nvim

WORKDIR /home/developer/proyecto

USER root

RUN chown developer:developer /home/developer

ENTRYPOINT [ "/usr/bin/sshd", "-D" ]
