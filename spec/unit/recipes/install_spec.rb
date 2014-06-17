require 'spec_helper'

describe 'ice_nginx::install' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should install nginx' do
    expect(chef_run).to install_package('nginx')
  end

  it 'should create configuration directory' do
    expect(chef_run).to create_directory('/etc/nginx')
  end

  it 'should create the conf.d directory' do
    expect(chef_run).to create_directory('/usr/local/nginx/conf.d').with_owner('root')
  end

  it 'should create the log directory' do
    expect(chef_run).to create_directory('/var/log/nginx').with_owner('nginx')
  end

  it 'should create the sites-enabled directory' do
    expect(chef_run).to create_directory('/etc/nginx/sites-enabled').with_owner('root')
  end

  it 'should create the sites-available directory' do
    expect(chef_run).to create_directory('/etc/nginx/sites-available').with_owner('root')
  end

  it 'should create an error log file' do
    expect(chef_run).to render_file('/var/log/nginx/error.log')
  end

  it 'should delete the default config file' do
    expect(chef_run).to delete_file('/usr/local/nginx/conf.d/default.conf')
  end
end
