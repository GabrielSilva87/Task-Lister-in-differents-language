sudo apt update
sudo apt-get install nasm
sudo apt install libgtk-3-dev
wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt install build-essential
sudo dpkg -i packages-microsoft-prod.deb
sudo apt install gnucobol
curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh
chmod +x linux-install.sh
sudo ./linux-install.sh
sudo apt install sbcl
sudo apt install clisp
sudo apt install dmd
sudo apt update -y
sudo apt install apt-transport-https
sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'echo "deb [arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main" > /etc/apt/sources.list.d/dart_stable.list'
sudo apt update
sudo apt install dart
sudo apt update
sudo apt install -y wget gnupg
wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb
sudo dpkg -i erlang-solutions_2.0_all.deb
sudo apt install -y esl-erlang
sudo apt install -y elixir
sudo apt install erlang
sudo apt install gfortran
sudo apt install git
sudo apt install golang
go get fyne.io/fyne/v2
curl -s "https://get.sdkman.io" | bash
exec bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install groovy
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
sudo apt install openjdk-11-jdk
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
wget https://github.com/JetBrains/kotlin/releases/download/v1.7.10/kotlin-compiler-1.7.10.zip
unzip kotlin-compiler-1.7.10.zip
sudo apt install lua
sudo apt install ocaml
sudo apt install gcc gobjc gnustep-devel
sudo apt install octave
sudo apt install php
sudo apt install fpc
sudo apt install swi-prolog
sudo apt install perl
sudo apt install python3
sudo add-apt-repository ppa:marutter/rrutter4.0
sudo apt install r-base
sudo apt install ruby
sudo apt install mysql-server
sudo systemctl start mysql
sudo apt install scala
wget https://swift.org/builds/swift-5.7.1-release/ubuntu2004/swift-5.7.1-RELEASE/swift-5.7.1-RELEASE-ubuntu20.04.tar.gz
sudo mv swift-5.7.1-RELEASE-ubuntu20.04 /usr/share/swift
export PATH=/usr/share/swift/usr/bin:"$PATH"
source ~/.bashrc