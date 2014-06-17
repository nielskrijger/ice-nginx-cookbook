require 'spec_helper'

describe 'ice_nginx::init' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'configures the init.d template' do
  	expect(chef_run).to create_template('/etc/init.d/nginx')
	  .with_owner('root')
  end

  it 'starts and enables the service' do
    expect(chef_run).to start_service('nginx')
    expect(chef_run).to enable_service('nginx')
  end
end
