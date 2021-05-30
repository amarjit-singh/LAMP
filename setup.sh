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
INSTALL_PKGS="apache2 libapache2-mod-php${PHP_VERSION} php${PHP_VERSION} php${PHP_VERSION}-mysql php${PHP_VERSION}-mbstring php${PHP_VERSION}-curl php${PHP_VERSION}-common php${PHP_VERSION}-dev php${PHP_VERSION}-gd php${PHP_VERSION}-imagick php${PHP_VERSION}-mcrypt php${PHP_VERSION}-ps php${PHP_VERSION}-pspell php${PHP_VERSION}-recode php${PHP_VERSION}-xsl php${PHP_VERSION}-json php${PHP_VERSION}-cgi php${PHP_VERSION}-ldap php${PHP_VERSION}-ldap zip"
for i in $INSTALL_PKGS; do
  echo "Installing: $i"
  apt install -y $i
done
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