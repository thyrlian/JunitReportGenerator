module JunitReportGenerator
  class NoAttributeError < StandardError
    attr_reader :msg
    
    def initialize(attribute, object)
      @msg = "undefined attribute `#{attribute.to_s}' for #{object}"
    end
    
    def message
      @msg
    end
  end
end