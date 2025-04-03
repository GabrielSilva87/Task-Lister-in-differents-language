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