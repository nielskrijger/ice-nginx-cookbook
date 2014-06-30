use_inline_resources

action :create do

  # To notify nginx service we need to redefine it within the LWRP. Not sure why but it follows the solution proposed
  # here: http://www.sharp-tools.net/archives/002187.html
  service 'nginx' do
    supports status: true, restart: true, reload: true
    action :nothing
  end

  template "#{node['ice_nginx']['conf']['sites_available']}/#{new_resource.name}.conf" do
    cookbook 'ice_nginx'
    owner 'root'
    group 'root'
    mode '0644'
    source 'app.conf.erb'
    variables(
        resource: new_resource
    )
    notifies :reload, 'service[nginx]', :delayed
  end

  link "#{node['ice_nginx']['conf']['sites_enabled']}/#{new_resource.name}.conf" do
    to "#{node['ice_nginx']['conf']['sites_available']}/#{new_resource.name}.conf"
  end

  new_resource.updated_by_last_action(true)
end
