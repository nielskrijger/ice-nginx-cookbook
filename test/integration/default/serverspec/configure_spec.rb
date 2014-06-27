require 'spec_helper'

describe 'Configure' do

  describe file('/etc/nginx/nginx.conf') do
    it { should be_file }
    it { should be_owned_by 'root' }
  end

end
