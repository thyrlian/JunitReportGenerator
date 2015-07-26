module JunitReportGenerator
  module Elementary
    attr_reader :attributes
    
    def assemble_attributes(*attrs)
      attributes = {}
      attrs.each do |attr|
        attr = attr.to_sym
        attributes[attr] = instance_variable_get("@#{attr.id2name}")
      end
      instance_variable_set(:@attributes, attributes)
    end
    
    def update_attributes(*attrs)
      attrs.each do |attr|
        attr = attr.to_sym
        instance_variable_get(:@attributes)[attr] = instance_variable_get("@#{attr.id2name}")
      end
    end
  end
end