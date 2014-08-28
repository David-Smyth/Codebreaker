require 'rspec/core/rake_task'
 
RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ['--color', '--format', 'doc']
end

require 'rubygems'

begin
  require 'cucumber'
  require 'cucumber/rake/task'
  
  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "--format pretty"
  end
  
  desc "Run cucumber and rspec tests"
  task :test do
    Rake::Task["features"].invoke
    Rake::Task["spec"].invoke
  end

  #task :features => 'db:test:prepare'

rescue LoadError
  desc 'Cucumber rake task not available'
  task :features do
    abort 'Cucumber rake task not available. Be sure to install cucumber as a gem or plugin'
  end
end
