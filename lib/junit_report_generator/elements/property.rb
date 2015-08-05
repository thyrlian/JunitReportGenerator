require_relative '../elementary'

module JunitReportGenerator
  class Property
    include Elementary
    
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