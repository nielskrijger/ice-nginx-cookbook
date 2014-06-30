if defined?(ChefSpec)
  def create_nginx_site(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:ice_nginx_site, :create, resource_name)
  end
end
