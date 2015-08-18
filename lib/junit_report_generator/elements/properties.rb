require_relative 'element'

module JunitReportGenerator
  class Properties < Element
    include_containable
    
    def initialize
      register
    end
    
    class << self
      def xml_tag_name
        'properties'
      end
    end
  end
end
