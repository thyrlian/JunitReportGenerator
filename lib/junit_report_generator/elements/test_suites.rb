require_relative 'element'

module JunitReportGenerator
  class TestSuites < Element
    include_containable
    
    def initialize
      @tests = 0
      @errors = 0
      @failures = 0
      @disabled = 0
      @time = 0
      assemble_attributes(:tests, :errors, :failures, :disabled, :time)
      register do |sub_elements|
        sub_elements.each do |sub_element|
          attributes = sub_element.attributes
          @tests += attributes.fetch(:tests, 0).to_i
          @errors += attributes.fetch(:errors, 0).to_i
          @failures += attributes.fetch(:failures, 0).to_i
          @disabled += attributes.fetch(:disabled, 0).to_i
          @time += attributes.fetch(:time, 0).to_f
        end
        update_attributes(:tests, :errors, :failures, :disabled, :time)
      end
    end
    
    class << self
      def xml_tag_name
        'testsuites'
      end
    end
  end
end
