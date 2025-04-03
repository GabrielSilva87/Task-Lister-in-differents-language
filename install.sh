sudo apt update
sudo apt-get install nasm
sudo apt install libgtk-3-dev
wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt install build-essential
sudo dpkg -i packages-microsoft-prod.deb
sudo apt install gnucobol