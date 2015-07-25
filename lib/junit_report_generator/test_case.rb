module JunitReportGenerator
  class TestCase
    attr_reader :name, :attributes
    
    def initialize(name)
      @name = name
      @attributes = {:name => @name}
    end
  end
end