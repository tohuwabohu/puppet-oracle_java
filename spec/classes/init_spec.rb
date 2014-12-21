require 'spec_helper'

describe 'oracle_java' do
  let(:title) { 'oracle_java' }
  let(:facts) { {:concat_basedir => '/path/to/dir'} }

  describe 'by default' do
    let(:params) { {} }

    specify { should contain_concat('/var/cache/debconf/java.preseed') }
  end
end

