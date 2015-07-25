module JunitReportGenerator
  class TestSuite
    attr_reader :name, :tests, :test_cases
    
    def initialize(name)
      @name = name
      @tests = 0
      @test_cases = []
    end
    
    def add(test_case)
      @test_cases.push(test_case)
      @tests = @test_cases.size
      self
    end
  end
end