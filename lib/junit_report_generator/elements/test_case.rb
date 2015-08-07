require_relative 'element'

module JunitReportGenerator
  class TestCase < Element
    def initialize(name)
      @name = name
      assemble_attributes(:name)
    end
    
    class << self
      def xml_tag_name
        'testcase'
      end
    end
  end
end