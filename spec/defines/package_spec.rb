require 'spec_helper'

describe 'java::package' do
  let(:title) { 'java-package' }
  let(:facts) { {:lsbdistid => 'Debian', :concat_basedir => '/path/to/dir'} }

  describe 'by default' do
    let(:params) { {} }

    specify { should contain_concat__fragment('java-package.preseed').with_ensure('absent') }
    specify { should contain_package('java-package').with_ensure('installed') }
  end

  describe 'with ensure => latest' do
    let(:params) { {:ensure => 'latest'} }

    specify { should contain_package('java-package').with_ensure('latest') }
  end

  describe 'with name => example' do
    let(:params) { {:name => 'example'} }

    specify { should contain_package('example') }
  end

  describe 'should not accept invalid ensure' do
    let(:params) { {:ensure => 'in va lid'} }

    specify do
      expect { should contain_package('java-package') }.to raise_error(Puppet::Error, /ensure must be either/)
    end
  end

  describe 'sun-java6-jdk' do
    let(:params) { {:name => 'sun-java6-jdk'} }

    specify { should contain_concat__fragment('sun-java6-jdk.preseed').
      with_ensure('present').
      with_content(/sun-java6-bin shared\/accepted-sun-dlj-v1-1 boolean true/)
    }
    specify { should contain_package('sun-java6-jdk') }
  end

  describe 'oracle-java6-installer' do
    let(:params) { {:name => 'oracle-java6-installer'} }
    let(:facts) { {:lsbdistid => 'Debian', :concat_basedir => '/path/to/dir'} }

    specify { should contain_concat__fragment('oracle-java6-installer.preseed').
      with_ensure('present').
      with_content(/oracle-java6-installer shared\/accepted-oracle-license-v1-1 select true/)
    }
    specify { should contain_package('oracle-java6-installer') }
  end

  describe 'should include apt::source for oracle installer on Debian' do
    let(:params) { {:name => 'oracle-java6-installer'} }
    let(:facts) { {:lsbdistid => 'Debian', :concat_basedir => '/path/to/dir'} }

    specify { should contain_apt__source('webupd8team').with_release('precise') }
  end

  describe 'should include apt::source for oracle installer on Ubuntu' do
    let(:params) { {:name => 'oracle-java6-installer'} }
    let(:facts) { {:lsbdistid => 'Ubuntu', :lsbdistcodename => 'trusty', :concat_basedir => '/path/to/dir'} }

    specify { should contain_apt__source('webupd8team').with_release('trusty') }
  end
end
