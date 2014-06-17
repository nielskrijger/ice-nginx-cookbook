require 'spec_helper'

describe 'ice_nginx::conf' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

end
