require_relative 'element'

module JunitReportGenerator
  class Property < Element
    def initialize(name, value)
      @name = name
      @value = value
      assemble_attributes(:name, :value)
    end
    
    class << self
      def xml_tag_name
        'property'
      end
    end
  end
end
