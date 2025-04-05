pkg update && pkg upgrade

pkg install nasm
pkg install clang gtk+3
pkg install wget
pkg install curl
pkg install git
pkg install golang
pkg install python
pkg install ruby
pkg install php
pkg install lua
pkg install ocaml
pkg install gcc
pkg install gobjc
pkg install prolog
pkg install perl
pkg install octave
pkg install fpc

pkg install dart

pkg install erlang
pkg install elixir

pkg install nodejs

npm install -g typescript
npm install -g react

wget https://github.com/JetBrains/kotlin/releases/download/v1.7.10/kotlin-compiler-1.7.10.zip
unzip kotlin-compiler-1.7.10.zip

pkg install mariadb
mysqld_safe &

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install groovy

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /data/data/com.termux/files/usr/bin/yq
chmod +x /data/data/com.termux/files/usr/bin/yq

echo "Instalação concluída. Verifique se todos os pacotes foram instalados corretamente."