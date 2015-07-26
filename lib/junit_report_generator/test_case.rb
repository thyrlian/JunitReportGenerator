require_relative 'elementary'

module JunitReportGenerator
  class TestCase
    include Elementary
    
    def initialize(name)
      @name = name
      assemble_attributes(:name)
    end
    
    class << self
      def create(name)
        new(name)
      end
    end
    
    private_class_method :new
  end
end