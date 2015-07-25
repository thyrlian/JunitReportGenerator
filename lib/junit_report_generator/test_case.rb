require_relative 'elementary'

module JunitReportGenerator
  class TestCase
    include Elementary
    
    attr_reader :name
    
    def initialize(name)
      @name = name
      assemble_attributes(:name)
    end
  end
end