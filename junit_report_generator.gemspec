# encoding: utf-8

$: << File.expand_path('../lib', __FILE__)
require 'junit_report_generator'

Gem::Specification.new do |s|
  s.name        = 'junit_report_generator'
  s.version     = JunitReportGenerator::VERSION
  s.license     = 'MIT'
  s.date        = '2015-08-11'
  s.summary     = 'Easy and flexible solution to generating JUnit test result report from any format of data.'
  s.description = 'Easy and flexible solution to generating JUnit test result report from any format of data.'
  s.authors     = ['Jing Li']
  s.email       = ['thyrlian@gmail.com']
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage    = 'https://github.com/thyrlian/JunitReportGenerator'
  s.add_dependency 'nokogiri', '>= 1.6.6.2'
  s.add_development_dependency 'rake', '~> 10.4.2'
  s.add_development_dependency 'minitest', '~> 5.7.0'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.7'
end