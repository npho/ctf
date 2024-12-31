FROM ubuntu:plucky

LABEL maintainer="npho"
LABEL version="0.1"

ENV DEBIAN_FRONTEND=noninteractive

# install dependencies
RUN apt-get update 
RUN apt-get install -y \
		binutils-x86-64-linux-gnu \
		build-essential \
		curl \
		emacs \
		git \
		libffi-dev \
		libssl-dev \
		radare2 \
		vim \
		zsh

RUN usermod -s /bin/zsh root
RUN usermod -s /bin/zsh ubuntu

# install micromamba
ENV MAMBA_ROOT_PREFIX=/opt/mamba/
RUN mkdir -p ${MAMBA_ROOT_PREFIX}
RUN chown -R ubuntu:ubuntu ${MAMBA_ROOT_PREFIX}
WORKDIR /home/ubuntu

USER ubuntu
RUN curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
RUN ln -s /home/ubuntu/bin/micromamba /home/ubuntu/bin/mamba
#RUN /home/ubuntu/bin/micromamba shell init -s zsh -r ${MAMBA_ROOT_PREFIX}

ENV PATH=/home/ubuntu/bin:$PATH

# install pwntools
RUN eval $(micromamba shell hook --shell posix)
COPY mamba-pwntools.yml /tmp/mamba-pwntools.yml
RUN micromamba create -y -f /tmp/mamba-pwntools.yml
RUN micromamba clean --all --yes

COPY motd /etc/update-motd.d/motd
COPY zsh-rc /home/ubuntu/.zshrc

CMD ["/bin/zsh"]
