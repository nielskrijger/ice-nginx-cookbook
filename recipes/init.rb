#
# Adds Nginx init.d configuration. Does not make use of native upstart scripts
# because Nginx spawns processes itself which upstart doesn't support without
# using the start-stop-daemon command (which is available by default only for
# debian systems).
#
# Author : Niels Krijger
#

template '/etc/init.d/nginx' do
  owner 'root'
  group 'root'
  mode '0755'
  source 'init.erb'
end

service 'nginx' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end
