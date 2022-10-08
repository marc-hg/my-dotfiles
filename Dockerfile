FROM debian:stable

RUN apt-get update --fix-missing
RUN apt-get install stow sudo git -y


# Set user and group
ARG user=debian
ARG group=debian
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${gid} ${group}
RUN useradd -u ${uid} -g ${group} -s /bin/sh -m ${user} -G sudo
RUN passwd -d $user

# # Switch to user
USER ${uid}:${gid}
WORKDIR /home/${user}
COPY . ./dotfiles


RUN ~/dotfiles/src/conf_setup.sh --yes
RUN ~/dotfiles/src/program_setup.sh --yes
