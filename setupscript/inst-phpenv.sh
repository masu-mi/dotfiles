#!/usr/bin/env bash



# for building php
brew install re2c
brew install libmcrypt

# php is used with apache httpd often.
brew tap Homebrew/dupes
brew install httpd

# libphp5.soを有効にする
httpd_conf_path=$(httpd -V |awk 'BEGIN{FS="\""} /SERVER_CONFIG_FILE/{print $2}')
sed -i -e "s/#LoadModule php5_module/LoadModule php5_module/" $httpd_conf_path


# install phpenv, dependencies and plugin
curl https://raw.github.com/CHH/phpenv/master/bin/phpenv-install.sh | sh
# add --with-apxs2=/usr/sbin/apxs
echo "--with-apxs2=/usr/sbin/apxs" >> ${HOME}/.phpenv/plugins/php-build/share/php-build/default_configure_options

git clone https://github.com/CHH/php-build/ ${HOME}/.phpenv/plugins/php-build
cp ~/.phpenv/plugins/php-build/bin/phpenv-install ~/.phpenv/plugins/php-build/bin/rbenv-install
sed -i -e "s/# Provide phpenv completions/# Provide rbenv completions/g" ~/.phpenv/plugins/php-build/bin/rbenv-install
git clone https://github.com/garamon/phpenv-apache-version ~/.phpenv/plugins/phpenv-apache-version
# fix PATH of libphp5.so for phpenv-apache-version
cat <<EOT
## change source to
PHP_MODULE_PATH="${PHPENV_PREFIX_PATH}/libexec/apache2/libphp5.so"
EOT
cat ~/.phpenv/plugins/phpenv-apache-version/bin/rbenv-apache-version |grep libphp5.so

phpenv rehash

phpenv install 5.5.0RC3
phpenv install 5.5.5

# install xdebug, xprof, webgrind, unit, phing
