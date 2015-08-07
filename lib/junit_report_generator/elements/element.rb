require_relative '../elementary'
require_relative '../containable'

module JunitReportGenerator
  class Element
    include Elementary
    
    class << self
      def create(*args)
        new(*args)
      end
      
      def include_containable
        include Containable
      end
      
      def xml_tag_name
        raise(NotImplementedError, "Abstract method [#{__method__}] is called, please implement", caller)
      end
    end
    
    private_class_method :new, :include_containable
  end
end