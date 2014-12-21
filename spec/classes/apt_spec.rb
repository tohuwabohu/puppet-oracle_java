require 'spec_helper'

describe 'oracle_java::apt' do
  let(:title) { 'oracle_java::apt' }
  let(:apt_source) { 'webupd8team' }

  describe 'on Debian' do
    let(:facts) { {:lsbdistid => 'Debian'} }

    specify { should contain_apt__source(apt_source).with_release('precise') }
  end

  describe 'on Ubuntu 14.10' do
    let(:facts) { {:lsbdistid => 'Ubuntu', :lsbdistcodename => 'utopic'} }

    specify { should contain_apt__source(apt_source).with_release('utopic') }
  end
end

