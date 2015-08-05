require_relative '../elementary'
require_relative '../containable'

module JunitReportGenerator
  class TestSuite
    include Elementary
    include Containable
    
    def initialize(name)
      @name = name
      @tests = 0
      assemble_attributes(:name, :tests)
      register do |sub_elements|
        @tests = sub_elements.size
        update_attributes(:tests)
      end
    end
    
    class << self
      def create(name)
        new(name)
      end
    end
    
    private_class_method :new
  end
end