if defined?(ChefSpec)
  def create_nginx_conf(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:ice_nginx_conf, :create, resource_name)
  end
end
