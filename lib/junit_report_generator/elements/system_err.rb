require_relative 'element'

module JunitReportGenerator
  class SystemErr < Element
    class << self
      def xml_tag_name
        'system-err'
      end
    end
  end
end
