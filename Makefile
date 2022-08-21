# Welcome message
index:
	#                USAGE
	# =======================================
	# 1. make install_all            || Install everything
	# 2. make install_zsh            || Install zsh and oh-my-zsh
	# 3. make install_nvim           || Install neovim
	# 4. make install_docker         || Install docker
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
