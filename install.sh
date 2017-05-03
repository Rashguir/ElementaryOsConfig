#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y software-properties-common
sudo add-apt-repository -y  ppa:philip.scott/elementary-tweaks
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt update

# Basic stuff
sudo apt install -y firefox terminator neovim git
sudo apt install -y elementary-tweaks

# set colored prompt
cd ~
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' .bashrc

# Theme install
cd ~/Downloads
wget https://github.com/LinxGem33/OSX-Arc-White/releases/download/v1.4.1/osx-arc-collection_1.4.1_amd64.deb
sudo dpkg -i osx-arc-collection_1.4.1_amd64.deb
rm osx-arc-collection_1.4.1_amd64.deb
cd ~

# Slack install
cd ~/Downloads
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.5.2-amd64.deb
sudo dpkg -i slack-desktop-2.5.2-amd64.deb
sudo apt-get -f install -y
sudo dpkg -i slack-desktop-2.5.2-amd64.deb
rm slack-desktop-2.5.2-amd64.deb
cd ~

# Franz install
cd ~/Downloads
mkdir franz
cd franz
wget https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz
tar -xf Franz-linux-x64-4.0.4.tgz
rm Franz-linux-x64-4.0.4.tgz
cd ~
mkdir ~/bin
mv ~/Downloads/franz ~/bin
cd /usr/share/applications
sudo touch franz.desktop
sudo chmod 777 franz.desktop
echo '[Desktop Entry]' >> franz.desktop
echo 'Name=Franz'>> franz.desktop
echo 'Type=Application' >> franz.desktop
echo 'Exec=/home/nico/bin/franz/Franz' >> franz.desktop
echo 'Terminal=false' >> franz.desktop
echo 'Icon=/home/nico/bin/franz/resources/app.asar.unpacked/assets/franz.png' >> franz.desktop
echo 'Comment=General chat client' >> franz.desktop
echo 'Categories=Internet' >> franz.desktop
echo 'Keywords=Internet;Chat;Web' >> franz.desktop
echo 'GenericName=Chat client'>> franz.desktop
sudo chmod 644 franz.desktop
cd ~

# PhpStorm install
cd ~/bin
wget https://download.jetbrains.com/webide/PhpStorm-2017.1.3.tar.gz
tar -xf PhpStorm-2017.1.3.tar.gz
mv PhpStorm-171.4424.11/ PhpStorm
rm PhpStorm-2017.1.3.tar.gz
cd ~
# only have to start ~/bin/PhpStorm/bin/phpstorm.sh to create shortcut

# LAPP stack
sudo apt install -y apache2 php7.1 postgresql-9.6 php7.1-pgsql
sudo apt install -y php7.1-bcmath php7.1-xml php7.1-mbstring
sudo a2enmod rewrite
sudo systemctl restart apache2.service

# install docker CE
sudo apt -y install apt-transport-https ca-certificates curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker $USER
sudo systemctl enable docker

# Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code

# Composer
cd ~/bin
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --filename=composer
php -r "unlink('composer-setup.php');"
cd ~

# Spotify
sudo apt install -y spotify-client

# Node & npm
sudo apt install -y nodejs


