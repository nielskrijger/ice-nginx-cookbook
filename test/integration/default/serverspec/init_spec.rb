require 'spec_helper'

describe 'Init' do

  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  describe file('/etc/init.d/nginx') do
    it { should be_file }
    it { should be_owned_by 'root' }
  end

end
