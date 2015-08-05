require 'nokogiri'

module JunitReportGenerator
  class Generator
    class << self
      def produce(test_suites)
        builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
          xml.testsuites(test_suites.attributes) do
            test_suites.sub_elements.each do |test_suite|
              xml.testsuite(test_suite.attributes) do
                test_suite.sub_elements.each do |test_case|
                  xml.testcase(test_case.attributes)
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