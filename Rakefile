$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), *%w[lib])))
require 'junit_report_generator'
require 'rake/testtask'

ENV['CODECLIMATE_REPO_TOKEN'] = '3124e4d5ad973c852dccbc34eb6bd3eb93ca3ab83f1cdcf1b6a56350c8388450'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/test*.rb']
end

desc 'Run tests'
task :default => :test