require_relative 'helper'

class TestProperty < Minitest::Test
  def test_xml_tag_name
    assert_equal('property', Property.xml_tag_name)
  end
end