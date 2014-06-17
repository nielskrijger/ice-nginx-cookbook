require 'spec_helper'

describe 'ice_nginx::init' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'starts and enables the service' do
    expect(chef_run).to notify('service[nginx').to(:enable)
    expect(chef_run).to notify('service[nginx').to(:start)
  end
end
