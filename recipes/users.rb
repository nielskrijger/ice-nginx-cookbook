#
# Create user and group
# Author : Niels Krijger
#

group node['nginx']['group'] do
  system true
  gid node['nginx']['gid']
end

user node['nginx']['user'] do
  group node['nginx']['group']
  home node['nginx']['homedir']
  system true
  action :create
  manage_home true
  uid node['nginx']['uid']
end

group node['nginx']['conf']['worker_group'] do
  system true
end

user node['nginx']['conf']['worker_user'] do
  group node['nginx']['conf']['worker_group']
  home node['nginx']['conf']['worker_homedir']
  system true
  action :create
  manage_home true
end