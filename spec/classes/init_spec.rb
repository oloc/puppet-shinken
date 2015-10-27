require 'spec_helper'
describe 'shinken' do

  context 'with defaults for all parameters' do
    it { should contain_class('shinken') }
  end
end
