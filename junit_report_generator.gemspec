# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = 'junit_report_generator'
  s.version     = '1.0.3'
  s.license     = 'MIT'
  s.date        = '2018-09-23'
  s.summary     = 'Generating JUnit test report easily from any source.'
  s.description = 'Generating JUnit test result report (xml) from any format of data by super easy and flexible syntax.  Most of the CIs (Continuous Integration) can aggregate JUnit style reports with zero effort.'
  s.authors     = ['Jing Li']
  s.email       = ['thyrlian@gmail.com']
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage    = 'https://github.com/thyrlian/JunitReportGenerator'
  s.required_ruby_version = '~> 2.1'
  s.add_runtime_dependency 'nokogiri', '~> 1.8', '>= 1.8.4'
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'minitest', '~> 5.11', '>= 5.11.3'
  s.add_development_dependency 'coveralls', '~> 0.8.22'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 1.0', '>= 1.0.7'
end
