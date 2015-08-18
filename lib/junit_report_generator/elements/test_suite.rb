require_relative 'element'
require_relative 'test_case'
require_relative 'error'
require_relative 'failure'
require_relative 'skipped'

module JunitReportGenerator
  class TestSuite < Element
    include_containable
    
    def initialize(name)
      @name = name
      @tests = 0
      @errors = 0
      @failures = 0
      @skipped = 0
      @time = 0
      assemble_attributes(:name, :tests, :errors, :failures, :skipped, :time)
      register do |sub_elements|
        sub_elements.each do |sub_element|
          if sub_element.is_a?(TestCase)
            @tests += 1
            @time += sub_element.attributes.fetch(:time, 0).to_f
            class_types = sub_element.sub_elements.map { |x| x.class }
            @errors += 1 if class_types.include?(Error)
            @failures += 1 if class_types.include?(Failure)
            @skipped += 1 if class_types.include?(Skipped)
          end
        end
        update_attributes(:tests, :errors, :failures, :skipped, :time)
      end
    end
    
    class << self
      def xml_tag_name
        'testsuite'
      end
    end
  end
end
