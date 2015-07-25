require 'nokogiri'

module JunitReportGenerator
  class Generator
    class << self
      def produce(*test_suites)
        builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
          xml.testsuites() do
            test_suites.each do |test_suite|
              xml.testsuite(:name => test_suite.name, :tests => test_suite.tests) do
                test_suite.test_cases.each do |test_case|
                  xml.testcase(:name => test_case.name) do
                    
                  end
                end
              end
            end
          end
        end
        builder.to_xml
      end
    end
    
    private_class_method :new
  end
end