require_relative 'helper'

class TestElementary < Minitest::Test
  def setup
    klass = Class.new do
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
    
    @object = klass.new('foobar', 88)
  end
  
  def test_assemble_attributes
    assert_equal({:name => 'foobar', :value => 88}, @object.attributes)
  end
  
  def test_update_attributes
    @object.change(1024)
    assert_equal({:name => 'foobar', :value => 1024}, @object.attributes)
  end
end