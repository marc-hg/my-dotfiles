FROM debian:stable

COPY ohmyzshplusplugins.sh /.dotfiles/
COPY mynvim.sh /.dotfiles/
COPY install.sh /.dotfiles/
COPY .zshrc /.dotfiles/

RUN apt update
RUN apt install sudo -y

RUN /.dotfiles/install.sh
