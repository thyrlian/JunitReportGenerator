$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), *%w[.. lib junit_report_generator])))

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'coveralls'
Coveralls.wear!

require 'junit_report_generator'
require 'minitest/autorun'

include JunitReportGenerator
