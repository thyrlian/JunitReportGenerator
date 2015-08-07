require_relative 'element'

module JunitReportGenerator
  class TestSuite < Element
    include_containable
    
    def initialize(name)
      @name = name
      @tests = 0
      assemble_attributes(:name, :tests)
      register do |sub_elements|
        @tests = sub_elements.size
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