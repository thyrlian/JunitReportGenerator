module JunitReportGenerator
  module Containable
    attr_reader :sub_elements
    
    def register(&blk)
      @blk = blk
    end
    
    def add(*sub_elements)
      @sub_elements ||= []
      @sub_elements.concat(sub_elements).uniq!
      @blk.call(@sub_elements) if defined?(@blk)
      self
    end
    
    private :register
  end
end