module JunitReportGenerator
  module Containable
    attr_reader :sub_elements

    def register(&blk)
      @sub_elements = []
      @blk = blk
    end

    def add(*sub_elements)
      @sub_elements ||= []
      @sub_elements.concat(sub_elements)
      @blk.call(sub_elements) if defined?(@blk) && @blk
      self
    end

    private :register
  end
end
