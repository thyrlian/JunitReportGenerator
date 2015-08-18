require_relative 'element'

module JunitReportGenerator
  class Skipped < Element
    class << self
      def xml_tag_name
        'skipped'
      end
    end
  end
end
