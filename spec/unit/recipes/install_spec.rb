require 'spec_helper'

describe 'ice_nginx::install' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs nginx' do
    expect(chef_run).to install_package('nginx')
  end

  it 'starts and enables the service' do
    expect(chef_run).to do_nothing
  end
end
