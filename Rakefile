
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["-c", "-f progress"]
  t.pattern = 'spec/**/*_spec.rb'
end

RSpec::Core::RakeTask.new(:features) do |t|
  t.rspec_path = 'rspec -Ifeatures --default_path features'
  t.rspec_opts = ["-c", "-f progress"]
  t.pattern = 'features/**/*_spec.rb'
end

task :default => [:spec, :features]
