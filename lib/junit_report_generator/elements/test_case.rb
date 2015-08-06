require_relative 'element'

module JunitReportGenerator
  class TestCase < Element
    def initialize(name)
      @name = name
      assemble_attributes(:name)
    end
  end
end