require_relative 'element'
require_relative '../containable'

module JunitReportGenerator
  class TestSuites < Element
    include Containable
    
    def initialize
      register
    end
  end
end