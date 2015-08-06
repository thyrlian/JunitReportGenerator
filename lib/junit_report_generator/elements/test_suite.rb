require_relative 'element'
require_relative '../containable'

module JunitReportGenerator
  class TestSuite < Element
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
  end
end