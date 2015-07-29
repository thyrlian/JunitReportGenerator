require_relative 'helper'

class TestElementary < MiniTest::Unit::TestCase
  def setup
    @klass = Class.new do
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
    
    @object = @klass.new('foobar', 88)
  end
  
  def test_assemble_attributes
    assert_equal({:name => 'foobar', :value => 88}, @object.attributes)
  end
  
  def test_update_attributes
    @object.change(1024)
    assert_equal({:name => 'foobar', :value => 1024}, @object.attributes)
  end
  
  def test_method_missing_should_add_optional_attribute
    @object.status('Unknown')
    assert_equal({:name => 'foobar', :value => 88, :status => 'Unknown'}, @object.attributes)
  end
  
  def test_method_missing_should_cache_optional_attribute_to_method
    assert(!@klass.instance_methods.include?(:status))
    @object.status('Unknown')
    assert(@klass.instance_methods.include?(:status))
    assert_equal({:name => 'foobar', :value => 88, :status => 'Unknown'}, @object.attributes)
  end
end