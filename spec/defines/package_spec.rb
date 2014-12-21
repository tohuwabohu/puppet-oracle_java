require 'spec_helper'

describe 'oracle_java::package' do
  let(:title) { 'oracle-java7-installer' }
  let(:facts) { {:lsbdistid => 'Debian', :concat_basedir => '/path/to/dir'} }

  describe 'by default' do
    let(:params) { {} }

    specify { should contain_concat__fragment('oracle-java7-installer.preseed').
      with_ensure('present').
      with_content(/oracle-java7-installer shared\/accepted-oracle-license-v1-1 select true/)
    }
    specify { should contain_package('oracle-java7-installer') }
  end

  describe 'should not accept invalid ensure' do
    let(:params) { {:ensure => 'in va lid'} }

    specify do
      expect { should contain_package('oracle-java7-installer') }.to raise_error(Puppet::Error, /ensure must be either/)
    end
  end

  describe 'oracle-java6-installer' do
    let(:title) { 'oracle-java6-installer' }

    specify { should contain_concat__fragment('oracle-java6-installer.preseed').
      with_ensure('present').
      with_content(/oracle-java6-installer shared\/accepted-oracle-license-v1-1 select true/)
    }
    specify { should contain_package('oracle-java6-installer') }
  end
end
