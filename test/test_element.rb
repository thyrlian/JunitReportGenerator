require_relative 'helper'

class TestElement < Minitest::Test
  def setup
    @klass = Class.new(Element) do
    end

    @klass_with_constructor = Class.new(Element) do
      attr_reader :name, :value

      def initialize(name, value)
        @name = name
        @value = value
        assemble_attributes(:name, :value)
      end
    end
  end

  def test_empty_constructor
    @klass.create
  end

  def test_constructor_with_arguments
    assert_raises ArgumentError do
      @klass_with_constructor.create
    end

    object = @klass_with_constructor.create('AwesomeTest', 23)
    assert_equal('AwesomeTest', object.name)
    assert_equal(23, object.value)
  end

  def test_private_class_method_new
    assert_raises NoMethodError do
      @klass.new
    end
  end

  def test_include_containable
    assert(!@klass.ancestors.include?(JunitReportGenerator::Containable))
    @klass.send(:include_containable)
    assert(@klass.ancestors.include?(JunitReportGenerator::Containable))
  end

  def test_xml_tag_name
    assert_raises NotImplementedError do
      @klass.xml_tag_name
    end
  end

  def test_attributes_is_initialized
    obj = @klass.create
    assert_equal({}, obj.attributes)
  end

  def test_attributes_is_not_reset
    obj = @klass_with_constructor.create('AwesomeTest', 23)
    assert_equal({ :name => 'AwesomeTest', :value => 23 }, obj.attributes)
  end
end
