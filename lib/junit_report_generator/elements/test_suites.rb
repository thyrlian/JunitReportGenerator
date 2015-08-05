require_relative '../elementary'
require_relative '../containable'

module JunitReportGenerator
  class TestSuites
    include Elementary
    include Containable
    
    def initialize
    end
    
    class << self
      def create
        new
      end
    end
    
    private_class_method :new
  end
end