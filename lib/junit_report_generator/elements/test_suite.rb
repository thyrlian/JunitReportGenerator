require_relative 'element'
require_relative 'test_case'

module JunitReportGenerator
  class TestSuite < Element
    include_containable
    
    def initialize(name)
      @name = name
      @tests = 0
      assemble_attributes(:name, :tests)
      register do
        @tests = @sub_elements.inject(0) do |sum, sub_element|
          sub_element.is_a?(TestCase) ? sum += 1 : sum
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