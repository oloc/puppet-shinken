require 'spec_helper'
describe 'shinken' do

  let(:title) { 'shinken' }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with defaults for all parameters' do
        it { should contain_class('shinken::install') }
        it { should contain_class('shinken::files') }
        it { should contain_class('shinken::service') }
      end
    end
  end
end