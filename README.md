# ice-nginx

Installs nginx from a local yum repository.

Defaults to the local

Build RPM from source
=====================

Execute the following commands

'''
	cd ~/
	sudo yum -y install gcc mysql-devel ruby-devel rubygems
	sudo yum install rpmdevtools rpmlint
	sudo gem install fpm
	wget http://nginx.org/download/nginx-1.6.0.tar.gz
	tar -xzvf nginx-1.6.0.tar.gz
	configure --with-pcre=../pcre-8.35/
	make
	mkdir /tmp/nginxinstall
	make install DESTDIR=/tmp/nginxinstall
	// Create after-install and after-remove scripts (see below)
	fpm -s dir -t rpm -v 1.6.0 -C /tmp/nginxinstall/ -n "nginx" --after-install ~/after-install.sh --after-remove ~/after-remove.sh usr/local
	sudo rpm -ivh nginx-1.6.0-1.x86_64.rpm
	scp nginx-1.6.0-1.x86_64.rpm root@om01.ice.local:/var/www/html/yum/icerepo/OL6/x86_64/getPackage

	// after-install.sh
	#!/bin/sh
	sudo ln -s /usr/local/nginx/sbin/nginx /usr/sbin/nginx

	// after-remove.sh
	#!/bin.sh
	rm /usr/sbin/nginx
'''
