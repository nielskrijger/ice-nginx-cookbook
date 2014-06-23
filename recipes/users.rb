#
# Create user and group
# Author : Niels Krijger
#

group node['ice_nginx']['group'] do
  system true
  gid node['ice_nginx']['gid']
end

user node['ice_nginx']['user'] do
  group node['ice_nginx']['group']
  home node['ice_nginx']['homedir']
  system true
  action :create
  manage_home true
  uid node['ice_nginx']['uid']
end

group node['ice_nginx']['conf']['worker_group'] do
  system true
end

user node['ice_nginx']['conf']['worker_user'] do
  group node['ice_nginx']['conf']['worker_group']
  home node['ice_nginx']['conf']['worker_homedir']
  system true
  action :create
  manage_home true
end
