require_relative 'helper'

class TestContainable < Minitest::Test
  def setup
    @klass_without_register = Class.new do
      include Containable
    end
    
    @klass_with_register = Class.new do
      include Containable
      
      attr_reader :count
      
      def initialize
        @count = 0
        register do |sub_elements|
          @count += sub_elements.size
        end
      end
    end
    
    @object_without_register = @klass_without_register.new
    @object_with_register = @klass_with_register.new
    
    @sub_element_1 = MiniTest::Mock.new
    @sub_element_2 = MiniTest::Mock.new
    @sub_element_3 = MiniTest::Mock.new
  end
  
  def test_add_by_splatting_arguments
    @object_without_register.add(@sub_element_1, @sub_element_2, @sub_element_3)
    assert_equal(3, @object_without_register.sub_elements.size)
  end
  
  def test_add_by_chaining
    @object_without_register.add(@sub_element_1).add(@sub_element_2)
    assert_equal(2, @object_without_register.sub_elements.size)
  end
  
  def test_register_with_block
    assert_equal(0, @object_with_register.count)
    @object_with_register.add(@sub_element_1).add(@sub_element_2)
    assert_equal(2, @object_with_register.count)
  end
end
