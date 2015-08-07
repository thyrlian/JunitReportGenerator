require_relative 'element'

module JunitReportGenerator
  class Properties < Element
    class << self
      def xml_tag_name
        'properties'
      end
    end
  end
end