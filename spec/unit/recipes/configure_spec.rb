require 'spec_helper'

describe 'ice_nginx::configure' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should create an init.d config file' do
    expect(chef_run).to render_file('/etc/nginx/nginx.conf')
  end
end
