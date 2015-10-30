require 'spec_helper'
describe 'shinken::users', :type => 'class' do

  let(:title) { 'shinken::users' }

  on_supported_os.each do |os, facts|
  context 'with defaults for all parameters' do
    it { should contain_group('shinken group') }
    it { should contain_user('shinken account') }
  end
  end
end