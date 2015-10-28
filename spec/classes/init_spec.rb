require 'spec_helper'
describe 'shinken' do

  context 'with defaults for all parameters' do
    it { should contain_class('shinken') }
    it { should contain_class('install') }
    it { should contain_class('files') }
    it { should contain_class('service') }
    it { should contain_class('module') }
  end
end
