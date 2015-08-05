require_relative '../elementary'

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
    
    def add(*test_cases)
      @test_cases += test_cases
      @tests = @test_cases.size
      update_attributes(:tests)
      self
    end
    
    class << self
      def create(name)
        new(name)
      end
    end
    
    private_class_method :new
  end
end