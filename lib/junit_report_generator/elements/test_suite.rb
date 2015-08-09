require_relative 'element'
require_relative 'test_case'

module JunitReportGenerator
  class TestSuite < Element
    include_containable
    
    def initialize(name)
      @name = name
      @tests = 0
      assemble_attributes(:name, :tests)
      register do |sub_elements|
        sub_elements.each do |sub_element|
          @tests += 1 if sub_element.is_a?(TestCase)
        end
        update_attributes(:tests)
      end
    end
    
    class << self
      def xml_tag_name
        'testsuite'
      end
    end
  end
end