require 'spec_helper'

describe 'java' do
  let(:title) { 'java' }

  describe 'by default' do
    let(:params) { {} }

    specify { should contain_package('sun-java6-jdk') }
  end
end

