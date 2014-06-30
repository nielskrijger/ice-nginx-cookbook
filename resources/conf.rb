actions :create
default_action :create

attribute :name, name_attribute: true, required: true
attribute :port, kind_of: Integer, default: '8080', required: true
attribute :server_name, kind_of: [String, Array], default: node['fqdn'], required: true
attribute :path, kind_of: String, required: true
attribute :locations, kind_of: Hash, required: true
