require 'spec_helper'

describe 'ice_nginx::install' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs nginx' do
    expect(chef_run).to install_package('nginx')
  end

  it 'should create configuration directory' do
    expect(chef_run).to create_directory("#{node['nginx']['dir']}")
  end
end
