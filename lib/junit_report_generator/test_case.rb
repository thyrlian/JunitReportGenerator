module JunitReportGenerator
  class TestCase
    attr_reader :name
    
    def initialize(name)
      @name = name
    end
  end
end