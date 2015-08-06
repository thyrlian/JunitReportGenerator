require_relative 'element'

module JunitReportGenerator
  class TestSuites < Element
    include_containable
    
    def initialize
      register
    end
  end
end