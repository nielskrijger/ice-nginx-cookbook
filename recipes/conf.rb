#
# Sets Nginx configuration
# Author : Niels Krijger
#

template node['nginx']['conf_file'] do
  owner 'root'
  group 'root'
  mode '0644'
  source 'nginx.conf.erb'
end
