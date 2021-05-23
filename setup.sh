#!/bin/bash

Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

# Update packages and Upgrade system
echo -e "$Cyan \n Updating System.."
apt update
apt install software-properties-common -y
add-apt-repository ppa:ondrej/php -y
apt update
echo $Color_Off

echo -e "$Green \n Installing Apache, PHP and PHP extensions"
apt install apache2 libapache2-mod-php7.2 php7.2 php7.2-mysql php7.2-mbstring php7.2-curl php7.2-common php7.2-dev php7.2-gd php7.2-imagick php7.2-mcrypt php7.2-ps php7.2-pspell php7.2-recode php7.2-xsl php7.2-json php7.2-cgi php7.2-ldap php7.2-ldap -y
echo $Color_Off

## TWEAKS and Settings
# Permissions
echo -e "$Cyan \n Permissions for /var/www $Color_Off"
chown -R www-data:www-data /var/www
echo -e "$Green \n Permissions have been set $Color_Off"

# Enabling Mod headers and Rewrite, required for WordPress permalinks and .htaccess files
echo -e "$Cyan \n Enabling Modules $Color_Off"
a2enmod rewrite && a2enmod headers

echo -e "$Green \n Creating vhosts $Color_Off"
cat <<EOF > /etc/apache2/sites-available/000-default.conf

EOF

# Restart Apache
echo -e "$Red \n Restarting Apache"
service apache2 restart
echo $Color_Off

echo -e "$Yellow \n Installing & Configuring SSH"
apt install -y ssh
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
service ssh restart
echo $Color_Off