require_relative 'helper'

class TestTestCase < Minitest::Test
  def test_create
    test_case = TestCase.create('Awesome Test')
    assert_equal('Awesome Test', test_case.instance_variable_get(:@name))
    assert_equal({ :name => 'Awesome Test' }, test_case.attributes)
    assert_equal([], test_case.sub_elements)
  end

  def test_xml_tag_name
    assert_equal('testcase', TestCase.xml_tag_name)
  end
end
