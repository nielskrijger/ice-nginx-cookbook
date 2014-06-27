default['ice_nginx']['user'] = 'nginx'
default['ice_nginx']['uid'] = nil # set to nil to let system pick
default['ice_nginx']['group'] = 'nginx'
default['ice_nginx']['gid'] = nil # set to nil to let system pick
default['ice_nginx']['version'] = '1.4.7'
default['ice_nginx']['keep_default_conf'] = false
default['ice_nginx']['binary'] = '/usr/sbin/nginx'
default['ice_nginx']['dir'] = '/usr/local/nginx'
default['ice_nginx']['log_dir'] = '/var/log/nginx'
default['ice_nginx']['conf_file'] = '/etc/nginx/nginx.conf'
default['ice_nginx']['package_name'] = 'nginx'
default['ice_nginx']['conf_dir'] = "#{node['ice_nginx']['dir']}/conf.d"

default['ice_nginx']['conf']['worker_user'] = 'www-data'
default['ice_nginx']['conf']['worker_group'] = 'www-data'
default['ice_nginx']['conf']['worker_homedir'] = '/home/www-data'
default['ice_nginx']['conf']['worker_processes'] = 1
default['ice_nginx']['conf']['error_log'] = "#{node['ice_nginx']['log_dir']}/error.log"
default['ice_nginx']['conf']['pid_file'] = '/var/run/nginx.pid'
default['ice_nginx']['conf']['worker_connections'] = 1024
default['ice_nginx']['conf']['worker_rlimit_nofile'] = nil
default['ice_nginx']['conf']['includes'] = ["#{node['ice_nginx']['dir']}/conf/mime.types"]
default['ice_nginx']['conf']['default_type'] = 'application/octet-stream'
default['ice_nginx']['conf']['sendfile'] = 'on'
default['ice_nginx']['conf']['keepalive_timeout'] = 65
default['ice_nginx']['conf']['conf_files_mask'] = "#{node['ice_nginx']['conf_dir']}/*.conf"
default['ice_nginx']['conf']['sites_enabled'] = '/etc/nginx/sites-enabled'
default['ice_nginx']['conf']['sites_available'] = '/etc/nginx/sites-available'
