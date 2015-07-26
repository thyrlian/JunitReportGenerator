require_relative 'elementary'

module JunitReportGenerator
  class TestCase
    include Elementary
    
    def initialize(name)
      @name = name
      assemble_attributes(:name)
    end
  end
end