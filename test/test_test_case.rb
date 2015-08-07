require_relative 'helper'

class TestTestCase < MiniTest::Unit::TestCase
  def setup
    @test_case = TestCase.create('Awesome Test')
  end
  
  def test_create
    assert_equal('Awesome Test', @test_case.instance_variable_get(:@name))
    assert_equal({:name => 'Awesome Test'}, @test_case.attributes)
  end
  
  def test_xml_tag_name
    assert_equal('testcase', TestCase.xml_tag_name)
  end
end