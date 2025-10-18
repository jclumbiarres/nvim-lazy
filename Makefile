# Makefile para instalar dependencias de Neovim + Go + TypeScript

.PHONY: all debian arch go-tools ts-ls

all: debian go-tools ts-ls

# Instalación para sistemas Debian/Ubuntu
# Uso: make debian
debian:
	sudo apt update
	sudo apt install -y git curl ripgrep fd-find xclip build-essential unzip python3-pip nodejs npm lazygit

# Instalación para sistemas Arch/Manjaro
# Uso: make arch
arch:
	sudo pacman -Sy --noconfirm neovim git curl ripgrep fd xclip base-devel unzip python-pip nodejs npm lazygit

# Instalar herramientas de Go necesarias para nvim
# Uso: make go-tools
go-tools:
	go install github.com/ramya-rao-a/go-outline@latest
	go install github.com/cweill/gotests/gotests@latest
	go install github.com/fatih/gomodifytags@latest
	go install github.com/josharian/impl@latest
	go install github.com/haya14busa/goplay/cmd/goplay@latest
	go install github.com/go-delve/delve/cmd/dlv@latest
	go install honnef.co/go/tools/cmd/staticcheck@latest
	go install golang.org/x/tools/gopls@latest
	go install mvdan.cc/gofumpt@latest
	go install golang.org/x/tools/cmd/goimports@latest

# Instalar typescript-language-server (ts_ls) y typescript global
# Uso: make ts-ls
ts-ls:
	npm install -g typescript typescript-language-server
