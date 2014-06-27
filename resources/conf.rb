actions :create
default_action :create

attribute :name, name_attribute: true, required: true
attribute :port, default: '8080', required: true
