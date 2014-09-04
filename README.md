ice_nodejs
==========

Installs nginx from a local yum repository.

Requirements
------------

Chef 11

### Platform

The ice_nginx cookbook has been tested on the following platforms:

* Oracle Linux 6.4

Attributes
----------

The attributes used by this cookbook are under the `ice_nodejs` namespace.

**General attributes**

Attribute                    | Description |Type | Default
-----------------------------|-------------|-----|--------
user                         | The Nginx user. | String | 'nginx'
uid                          | The user id. Set `nil` to let the system pick. | String | nil
group                        | The Nginx group. | String | 'nginx'
gid                          | The group id. Set `nil` to let the system pick. | String | gid
version                      | The Nginx version. | String | '1.4.7'
keep_default_conf            | Keep the default welcome page configuration. | Boolean | false
binary                       | The location of the nginx binary file. | String | '/usr/sbin/nginx'
dir                          | The installation directory. | String | '/usr/local/nginx'
log_dir                      | The directory in which nginx logs are stored. | String | '/var/log/nginx'
conf_file                    | The configuration file. | String | '/etc/nginx/nginx.conf'
package_name                 | The package name. | String | 'nginx'

**nginx.conf properties**

Attribute                    | Description |Type | Default
-----------------------------|-------------|-----|--------
conf[worker_user]            | The user of the nginx worker process. | String | 'www-data'
conf[worker_group]           | The group of the uworker process. | String | 'www-data'
conf[worker_homedir]         | The home directory of the nginx worker user. | String | '/home/www-data'
conf[worker_processes]       | The number of worker processes Nginx is running. | Number | 1
conf[error_log]              | The number of worker processes Nginx is running. | String | '/var/log/nginx/error.log'
conf[pid_file]               | The process id file used for locking. | String | '/var/run/nginx.pid'
conf[worker_connections]     | The maximum number of simultaneous connections that can be opened by a worker process. | Number | 1024
conf[worker_rlimit_nofile]   | The limit on the maximum number of open files (RLIMIT_NOFILE) for worker processes. | Number | nil
conf[includes]               | Includes another file, or files matching the specified mask, into configuration. | Array | ['/etc/nginx/conf/mime.types']
conf[default_type]           | Defines the default MIME type of a response. | String | 'application/octet-stream'
conf[sendfile]               | Enables or disables the use of sendfile(), either 'on' or 'off'. | String | 'off'
conf[keepalive_timeout]      | Sets a timeout during which a keep-alive client connection will stay open on the server side. | Number | 65
conf[conf_files_mask]        | The configuration daemon directory. | String | '/usr/local/nginx/conf.d/*.conf'
conf[sites_available]        | The directory containing site configuration files. | String | '/etc/nginx/sites-available'
conf[sites_enabled]          | The directory containing symlinks to the active sites. | String | '/etc/nginx/sites-enabled'


Recipes
-------

This section describes the recipes in the cookbook and how to use them in your environment.

### default

This recipe:

* Executes the `ice_nginx::users` recipe.
* Executes the `ice_nginx::install` recipe.
* Executes the `ice_nginx::configure` recipe.
* Executes the `ice_nginx::init` recipe.

### users

This recipe:

* Adds the user and group that runs the Nginx process.
* Adds the user and group that runs the Nginx worker processes.

### install

This recipe:

* Creates various required directories.
* Installs nginx from an RPM.

### configure

This recipe:

* Sets the nginx configuration file.

### init

* Adds the nginx init script.

TODO: Add monit script

Build RPM from source
---------------------

The following code snippet creates an RPM from sourcefiles (This should be automated in a Jenkins job!):


```
	cd ~/
	sudo yum -y groupinstall "Development Tools"
	sudo yum -y install ruby-devel rubygems
	sudo yum -y install rpmdevtools rpmlintsudo yum install rpmdevtools rpmlint
	sudo gem install fpm
	wget http://nginx.org/download/nginx-1.6.0.tar.gz
	tar -xzvf nginx-1.6.0.tar.gz
	cd nginx-1.6.0
	./configure --with-pcre=../pcre-8.35/
	make
	mkdir /tmp/nginxinstall
	make install DESTDIR=/tmp/nginxinstall
	echo -e '#!/bin/sh\nsudo ln -s /usr/local/nginx/sbin/nginx /usr/sbin/nginx' > ./after-install.sh
	echo -e '#!/bin.sh\nrm /usr/sbin/nginx' > ./after-remove.sh
	fpm -s dir -t rpm -v 1.6.0 -C /tmp/nginxinstall/ -n "nginx" --after-install ./after-install.sh --after-remove ./after-remove.sh usr/local
	sudo rpm -ivh nginx-1.6.0-1.x86_64.rpm
	scp nginx-1.6.0-1.x86_64.rpm root@om01.ice.local:/var/www/html/yum/icerepo/OL6/x86_64/getPackage

	// On the RPM repository: createrepo x
	createrepo /var/www/html/yum/icerepo/OL6/x86_64/
```

License and authors
-------------------

* Author: Niels Krijger <niels.krijger@icemobile.com>

Copyright 2014, IceMobile

All rights reserved.
