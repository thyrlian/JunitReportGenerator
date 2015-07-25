module JunitReportGenerator
  class TestSuite
    attr_reader :name, :tests, :test_cases, :attributes
    
    def initialize(name)
      @name = name
      @tests = 0
      @test_cases = []
      @attributes = {:name => @name, :tests => @tests}
    end
    
    def add(test_case)
      @test_cases.push(test_case)
      @tests = @test_cases.size
      @attributes[:tests] = @tests
      self
    end
  end
end