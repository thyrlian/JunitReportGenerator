require_relative 'elementary'

module JunitReportGenerator
  class TestSuite
    include Elementary
    
    attr_reader :test_cases
    
    def initialize(name)
      @name = name
      @tests = 0
      @test_cases = []
      assemble_attributes(:name, :tests)
    end
    
    def add(test_case)
      @test_cases.push(test_case)
      @tests = @test_cases.size
      update_attributes(:tests)
      self
    end
  end
end