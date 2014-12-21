require 'spec_helper_acceptance'

describe 'by default' do
  specify 'should provision with no errors' do
    pp = <<-EOS
      $packages = [
        'oracle-java6-installer',
        'oracle-java7-installer',
      ]

      java::package { $packages:
        ensure => installed,
      }
    EOS

    # Run it twice and test for idempotency
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes => true)
  end

  describe command('java -version') do
    its(:exit_status) { should eq 0 }
  end
end
