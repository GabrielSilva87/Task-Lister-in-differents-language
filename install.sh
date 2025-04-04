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