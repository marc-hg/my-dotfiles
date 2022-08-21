# Welcome message
index:
	#                USAGE
	# =======================================
	# Install everything: make install_all
	# Install zsh and oh-my-zsh: make install_zsh
	# Install neovim: make install_nvim
	# Install docker: make install_docker
	# =======================================

install_all:
	make install_zsh
	make install_nvim
	make install_docker

install_zsh:
	echo "Installing zsh, ohmyzsh and plugins..."
	./src/install_zsh.sh

install_nvim:
	echo "Installing neovim..."
	./src/install_nvim.sh

install_docker:
	echo "Installing docker..."
	./src/install_docker.sh
