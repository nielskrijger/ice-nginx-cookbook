#
# Cleans all existing repository files and inserts new ones
# Author : Niels Krijger
#

package node['ice_nginx']['package_name']

#
# Create directories
#

directories = [File.dirname(node['ice_nginx']['conf_file']),
               node['ice_nginx']['conf']['conf.d'],
               node['ice_nginx']['conf']['sites_enabled'],
               node['ice_nginx']['conf']['sites_available']]
directories.each do |dir|
  directory dir do
    action :create
    recursive true
    owner 'root'
    group 'root'
    mode '0755'
  end
end

directory File.dirname(node['ice_nginx']['conf']['error_log']) do
  action :create
  recursive true
  owner node['ice_nginx']['user']
  group node['ice_nginx']['group']
  mode '0755'
end

files = [node['ice_nginx']['conf']['error_log']]
files.each do |logfile|
  file logfile do
    owner node['ice_nginx']['user']
    group node['ice_nginx']['group']
    mode '0755'
    action :create_if_missing
  end
end

file node['ice_nginx']['conf']['conf.d'] + '/default.conf' do
  action :delete
end unless node['ice_nginx']['keep_default_conf']
