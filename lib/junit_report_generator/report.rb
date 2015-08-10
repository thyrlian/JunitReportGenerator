require_relative '../junit_report_generator'

module JunitReportGenerator
  class Report
    def initialize(test_suites)
      @test_suites = test_suites
    end
    
    class << self
      def on(test_suites)
        new(test_suites)
      end
    end
    
    def publish(file)
      xml = Generator.produce(@test_suites)
      File.open(file, 'w') do |f|
        f.puts xml
      end
    end
    
    private_class_method :new
  end
end