#
# Cleans all existing repository files and inserts new ones
# Author : Niels Krijger
#

include_recipe 'ice_localrepo::default' if node['nginx']['ice_localrepo']

package node['nginx']['package_name']

#
# Create directories
#

directories = [File.dirname(node['nginx']['conf_file']),
               node['nginx']['conf']['conf.d'],
               node['nginx']['conf']['sites_enabled']]
directories.each do |dir|
  directory dir do
    action :create
    recursive true
    owner 'root'
    group 'root'
    mode '0755'
  end
end

directory File.dirname(node['nginx']['conf']['error_log']) do
  action :create
  recursive true
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0755'
end

files = [node['nginx']['conf']['error_log']]
files.each do |logfile|
  file logfile do
    owner node['nginx']['user']
    group node['nginx']['group']
    mode '0755'
    action :create_if_missing
  end
end

unless node['nginx']['keep_default_conf']
  file node['nginx']['conf']['conf.d'] + '/default.conf' do
    action :delete
  end
end

service 'nginx' do
  supports status: true, restart: true, reload: true
  action [:nothing]
end
