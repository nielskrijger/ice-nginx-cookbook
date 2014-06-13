#
# Installs Nginx.
# Author : Niels Krijger
#

include_recipe "ice_nginx::users"
include_recipe "ice_nginx::package_install"
include_recipe "ice_nginx::conf"
include_recipe "ice_nginx::init"