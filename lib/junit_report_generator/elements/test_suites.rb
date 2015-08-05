require_relative '../elementary'

module JunitReportGenerator
  class TestSuites
    include Elementary
    
    attr_reader :test_suites
    
    def initialize
      @test_suites = []
    end
    
    def add(*test_suites)
      @test_suites += test_suites
      @test_suites.uniq!
      self
    end
    
    class << self
      def create
        new
      end
    end
    
    private_class_method :new
  end
end