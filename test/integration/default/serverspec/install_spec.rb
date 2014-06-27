require 'spec_helper'

describe 'Install' do

  describe package('nginx') do
    it { should be_installed }
  end

  describe user('root') do
    it { should exist }
  end

  describe file('/var/log/nginx') do
    it { should be_directory }
    it { should be_owned_by 'nginx' }
  end

end
