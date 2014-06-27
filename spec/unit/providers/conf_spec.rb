require 'spec_helper'

describe 'ice_nginx_test::conf' do
  let(:chef_run) { ChefSpec::Runner.new(step_into: 'ice_nginx_conf').converge(described_recipe) }

  it 'should run ice_nginx_conf LWRP' do
    expect(chef_run).to create_nginx_conf('test')
  end

  it 'should create /etc/nginx/sites-available/test.conf' do
    expect(chef_run).to render_file('/etc/nginx/sites-available/test.conf')
  end

  it 'should create a link /etc/nginx/sites-enabled/test.conf' do
    expect(chef_run).to create_link('/etc/nginx/sites-enabled/test.conf')
  end

end
