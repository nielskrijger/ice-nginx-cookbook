# ice-nginx

Installs nginx from a local yum repository.

TODO: add documentation

Build RPM from source
=====================

The following code snippet creates an RPM from sourcefiles (This should be automated in a Jenkins job!):


```
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
	echo -e '#!/bin/sh\nsudo ln -s /usr/local/nginx/sbin/nginx /usr/sbin/nginx' > ./after-install.sh
	echo -e '#!/bin.sh\nrm /usr/sbin/nginx' > ./after-remove.sh
	fpm -s dir -t rpm -v 1.6.0 -C /tmp/nginxinstall/ -n "nginx" --after-install ./after-install.sh --after-remove ./after-remove.sh usr/local
	sudo rpm -ivh nginx-1.6.0-1.x86_64.rpm
	scp nginx-1.6.0-1.x86_64.rpm root@om01.ice.local:/var/www/html/yum/icerepo/OL6/x86_64/getPackage

	// On the RPM repository: createrepo /var/www/html/yum/icerepo/OL6/x86_64/
```

echo -e '#!/bin.sh\nrm /usr/sbin/nginx' > ~/after-remove.sh
