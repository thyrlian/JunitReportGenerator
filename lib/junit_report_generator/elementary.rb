require_relative 'no_attribute_error'

module JunitReportGenerator
  module Elementary
    attr_reader :attributes
    
    def assemble_attributes(*attrs)
      attributes = {}
      attrs.each do |attr|
        attr = attr.to_sym
        begin
          attributes[attr] = self.send(attr)
        rescue NoMethodError => e
          raise(NoAttributeError.new(attr, self))
        end
      end
      self.instance_variable_set(:@attributes, attributes)
    end
    
    def update_attributes(*attrs)
      attrs.each do |attr|
        attr = attr.to_sym
        begin
          self.instance_variable_get(:@attributes)[attr] = self.send(attr)
        rescue NoMethodError => e
          raise(NoAttributeError.new(attr, self))
        end
      end
    end
  end
end