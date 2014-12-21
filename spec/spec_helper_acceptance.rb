require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'

unless ENV['BEAKER_PROVISION'] == 'no'
  hosts.each do |host|
    install_puppet
  end
end

RSpec.configure do |c|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  ignore_list = %w(junit log spec tests vendor)

  c.formatter = :documentation

  c.before :suite do
    hosts.each do |host|
      # Install module
      copy_module_to(host, :source => proj_root, :module_name => 'java', :ignore_list => ignore_list)

      # Install dependencies
      on host, puppet('module', 'install', 'puppetlabs-stdlib', '--version 4.4.0')
      on host, puppet('module', 'install', 'puppetlabs-apt', '--version 1.7.0')
      on host, puppet('module', 'install', 'puppetlabs-concat', '--version 1.1.2')
      on host, puppet('module', 'install', 'ripienaar-module_data', '--version 0.0.3')
    end
  end
end
