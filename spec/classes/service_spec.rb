require 'spec_helper'

describe 'postfix' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'when including postfix::service' do
        describe 'with default values for all parameters' do
          it { is_expected.to contain_service('postfix') }
        end

        context 'without service management' do
          let(:params) { { service_manage: false } }

          it { is_expected.not_to contain_service('postfix') }
        end
      end
    end
  end
end
