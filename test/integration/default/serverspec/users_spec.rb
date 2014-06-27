require 'spec_helper'

describe 'Users' do

  describe user('nginx') do
    it { should exist }
    it { should belong_to_group 'nginx' }
  end

  describe user('www-data') do
    it { should exist }
    it { should belong_to_group 'www-data' }
  end

end
