default['nginx']['user'] = 'nginx'
default['nginx']['uid'] = nil # set to nil to let system pick
default['nginx']['group'] = 'nginx'
default['nginx']['gid'] = nil # set to nil to let system pick
default['nginx']['version'] = '1.4.7'
default['nginx']['keep_default_conf'] = false
default['nginx']['binary'] = '/usr/sbin/nginx'
default['nginx']['dir'] = '/usr/local/nginx'
default['nginx']['log_dir'] = '/var/log/nginx'
default['nginx']['conf_file'] = '/etc/nginx/nginx.conf'
default['nginx']['ice_localrepo'] = true
default['nginx']['package_name'] = 'nginx'

default['nginx']['conf']['worker_user'] = 'www-data'
default['nginx']['conf']['worker_group'] = 'www-data'
default['nginx']['conf']['worker_homedir'] = '/home/www-data'
default['nginx']['conf']['worker_processes'] = 1
default['nginx']['conf']['error_log'] = "#{node['nginx']['log_dir']}/error.log"
default['nginx']['conf']['pid_file'] = '/var/run/nginx.pid'
default['nginx']['conf']['worker_connections'] = 1024
default['nginx']['conf']['worker_rlimit_nofile'] = nil
default['nginx']['conf']['include'] = ["#{node['nginx']['dir']}/conf/mime.types"]
default['nginx']['conf']['default_type'] = 'application/octet-stream'
default['nginx']['conf']['sendfile'] = 'on'
default['nginx']['conf']['keepalive_timeout'] = 65
default['nginx']['conf']['conf.d'] = "#{node['nginx']['dir']}/conf.d"
default['nginx']['conf']['sites_enabled'] = '/etc/nginx/sites-enabled'
default['nginx']['conf']['sites_available'] = '/etc/nginx/sites-available'
