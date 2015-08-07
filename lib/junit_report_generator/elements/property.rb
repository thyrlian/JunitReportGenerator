require_relative 'element'

module JunitReportGenerator
  class Property < Element
    class << self
      def xml_tag_name
        'property'
      end
    end
  end
end