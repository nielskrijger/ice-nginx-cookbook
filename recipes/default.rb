#
# Installs Nginx.
# Author : Niels Krijger
#

include_recipe 'ice_nginx::users'
include_recipe 'ice_nginx::install'
include_recipe 'ice_nginx::configure'
include_recipe 'ice_nginx::init'
