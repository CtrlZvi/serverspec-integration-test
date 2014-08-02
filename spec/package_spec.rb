require 'spec_helper'

runner = Specinfra::Runner.instance
version = runner.get_package_version('chef').stdout

describe package('chef') do
  it { should     be_installed }
  it { should     be_installed.with_version(version) }
  it { should_not be_installed.with_version('0.0.0.0') }
end

describe package('foo') do
  it { should_not be_installed }
end
