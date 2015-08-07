require_relative 'element'

module JunitReportGenerator
  class Failure < Element
    class << self
      def xml_tag_name
        'failure'
      end
    end
  end
end