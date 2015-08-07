require_relative 'element'

module JunitReportGenerator
  class Error < Element
    class << self
      def xml_tag_name
        'error'
      end
    end
  end
end