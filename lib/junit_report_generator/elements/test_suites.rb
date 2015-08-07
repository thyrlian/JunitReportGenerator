require_relative 'element'

module JunitReportGenerator
  class TestSuites < Element
    include_containable
    
    def initialize
      register
    end
    
    class << self
      def xml_tag_name
        'testsuites'
      end
    end
  end
end