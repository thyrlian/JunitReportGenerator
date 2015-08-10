# encoding: utf-8

$: << File.expand_path('../lib', __FILE__)
require 'junit_report_generator'

Gem::Specification.new do |s|
  s.name        = 'junit_report_generator'
  s.version     = JunitReportGenerator::VERSION
  s.license     = 'MIT'
  s.date        = '2015-08-11'
  s.summary     = 'Generating JUnit test report easily from any source.'
  s.description = 'Generating JUnit test result report (xml) from any format of data by super easy and flexible syntax.  Most of the CIs (Continuous Integration) can aggregate JUnit style reports with zero effort.'
  s.authors     = ['Jing Li']
  s.email       = ['thyrlian@gmail.com']
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage    = 'https://github.com/thyrlian/JunitReportGenerator'
  s.add_dependency 'nokogiri', '~> 1.6'
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'minitest', '~> 5.7'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.7'
end