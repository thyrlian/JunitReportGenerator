require_relative 'element'

module JunitReportGenerator
  class SystemOut < Element
    class << self
      def xml_tag_name
        'system-out'
      end
    end
  end
end
