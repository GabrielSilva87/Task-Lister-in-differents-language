#!/bin/bash

echo "Atualizando a lista de pacotes..."
sudo apt-get update

echo "Instalando OpenAL..."
sudo apt-get install -y libopenal-dev

echo "Instalando GTK 3..."
sudo apt-get install -y libgtk-3-dev

echo "Instalação concluída!"
echo "Para usar a WinAPI, você precisará de um ambiente Windows com um compilador como MinGW ou Visual Studio."