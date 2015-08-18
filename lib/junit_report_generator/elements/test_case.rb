require_relative 'element'

module JunitReportGenerator
  class TestCase < Element
    include_containable
    
    def initialize(name)
      @name = name
      assemble_attributes(:name)
      register
    end
    
    class << self
      def xml_tag_name
        'testcase'
      end
    end
  end
end
