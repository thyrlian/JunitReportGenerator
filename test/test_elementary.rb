require_relative 'helper'

class TestElementary < Minitest::Test
  def setup
    @klass_with_dflt_attrs = Class.new do
      include Elementary
      
      def initialize(name, value)
        @name = name
        @value = value
        assemble_attributes(:name, :value)
      end
      
      def change(value)
        @value = value
        update_attributes(:value)
      end
    end
    
    @klass_without_anything = Class.new do
      include Elementary
    end
    
    @obj_with_dflt_attrs = @klass_with_dflt_attrs.new('foobar', 88)
    @obj_without_dflt_attrs = @klass_without_anything.new
  end
  
  def test_assemble_attributes
    assert_equal({:name => 'foobar', :value => 88}, @obj_with_dflt_attrs.attributes)
  end
  
  def test_update_attributes
    @obj_with_dflt_attrs.change(1024)
    assert_equal({:name => 'foobar', :value => 1024}, @obj_with_dflt_attrs.attributes)
  end
  
  def test_method_missing_should_add_optional_attribute
    @obj_with_dflt_attrs.status('Unknown')
    assert_equal({:name => 'foobar', :value => 88, :status => 'Unknown'}, @obj_with_dflt_attrs.attributes)
  end
  
  def test_method_missing_should_cache_optional_attribute_to_method
    assert(!@klass_with_dflt_attrs.instance_methods.include?(:status))
    @obj_with_dflt_attrs.status('Unknown')
    assert(@klass_with_dflt_attrs.instance_methods.include?(:status))
    assert(({:name => 'foobar', :value => 88, :status => 'Unknown'}.to_a - @obj_with_dflt_attrs.attributes.to_a).empty?)
  end
end