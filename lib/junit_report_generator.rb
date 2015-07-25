Dir[(File.expand_path(File.dirname(__FILE__)) + "/junit_report_generator/*.rb")].each { |file| require file }

module JunitReportGenerator
  VERSION = '1.0.0'
end