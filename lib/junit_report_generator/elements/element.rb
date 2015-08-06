require_relative '../elementary'

module JunitReportGenerator
  class Element
    include Elementary
    
    class << self
      def create(*args)
        new(*args)
      end
    end
    
    private_class_method :new
  end
end