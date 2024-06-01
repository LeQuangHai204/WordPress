#!/bin/bash
sudo dnf install php php-cli php-common php-mysqlnd php-json php-xml -y
# sudo dnf install mariadb105-server -y
sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
sudo dnf install mysql80-community-release-el9-1.noarch.rpm -y
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023
sudo dnf install mysql-community-client -y
sudo rm mysql80-community-release-el9-1.noarch.rpm