require 'spec_helper'
describe 'shinken', :type => 'class' do

  let(:title) { 'shinken' }

  context 'with defaults for all parameters' do
    it { should contain_class('shinken::users') }
    it { should contain_class('shinken::install') }
    it { should contain_class('shinken::files') }
    it { should contain_class('shinken::service') }
  end
end