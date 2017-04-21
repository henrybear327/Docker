FROM ubuntu:xenial

RUN adduser --disabled-password --gecos "" ubuntu
RUN echo "ubuntu:ubuntu" | chpasswd
RUN usermod -aG sudo ubuntu
COPY .vimrc /home/ubuntu/.vimrc

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y locales sudo
RUN apt-get install -y openssh-server vim apt-utils git wget curl strace build-essential screen man gdb ltrace valgrind acl astyle clang-format
RUN mkdir /var/run/sshd

# locale 
RUN locale-gen en_US.UTF-8
RUN locale-gen zh_TW.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN echo "export LC_ALL=zh_TW.UTF-8" >> /home/ubuntu/.bashrc
RUN echo "export LANG=zh_TW.UTF-8" >> /home/ubuntu/.bashrc
RUN echo "export LANGUAGE=zh_TW.UTF-8" >> /home/ubuntu/.bashrc

# zsh
RUN apt-get update && apt-get install -y zsh git-core
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git /home/ubuntu/.oh-my-zsh \
    && cp /home/ubuntu/.oh-my-zsh/templates/zshrc.zsh-template /home/ubuntu/.zshrc \
    && chsh -s /bin/zsh ubuntu
RUN echo "export LC_ALL=zh_TW.UTF-8" >> /home/ubuntu/.zshrc
RUN echo "export LANG=zh_TW.UTF-8" >> /home/ubuntu/.zshrc
RUN echo "export LANGUAGE=zh_TW.UTF-8" >> /home/ubuntu/.zshrc

EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
