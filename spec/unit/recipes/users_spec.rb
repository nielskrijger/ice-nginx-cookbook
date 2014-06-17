require 'spec_helper'

describe 'ice_nginx::users' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should add user nginx' do
    expect(chef_run).to create_user('nginx')
    expect(chef_run).to create_group('nginx')
  end

  it 'should add user www-data' do
    expect(chef_run).to create_user('www-data')
    expect(chef_run).to create_group('www-data')
  end
end
