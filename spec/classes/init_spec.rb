require 'spec_helper'

describe 'java' do
  let(:title) { 'java' }
  let(:facts) { {:concat_basedir => '/path/to/dir'} }

  describe 'by default' do
    let(:params) { {} }

    specify { should contain_concat('/var/cache/debconf/java.preseed') }
  end
end

