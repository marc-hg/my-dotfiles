FROM debian:stable-slim 

COPY install.sh /.dotfiles/
COPY .zshrc /.dotfiles/

RUN /.dotfiles/install.sh
