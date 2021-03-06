#!/bin/bash

# Updating Linux
sudo apt-get update

URL=/vagrant/bootstrap/scripts/*.sh
for FILE in $URL; do
  if [ -f $FILE ] && [ -x $FILE ]; then
    $FILE $1
  fi
done

FRAMEWORK=$(sudo php /vagrant/bootstrap/sitehelper.php getframework)

if [ "$FRAMEWORK" = "wordpress" ] || [ "$FRAMEWORK" = "wp" ]
then
  echo "Installing Wordpress"
  /vagrant/bootstrap/frameworks/wordpress.sh
elif [ "$FRAMEWORK" = "wordpress-composer" ] || [ "$FRAMEWORK" = "wp-composer" ]
then
  echo "Installing Wordpress Bedrock"
  /vagrant/bootstrap/frameworks/wp-composer.sh
elif [ "$FRAMEWORK" = "laravel" ]
then
  echo "Installing Laravel"
  /vagrant/bootstrap/frameworks/laravel.sh
fi
