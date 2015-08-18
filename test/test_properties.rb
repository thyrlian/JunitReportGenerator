require_relative 'helper'

class TestProperties < Minitest::Test
  def test_create
    properties = Properties.create
    assert_equal([], properties.sub_elements)
  end
  
  def test_xml_tag_name
    assert_equal('properties', Properties.xml_tag_name)
  end
end
