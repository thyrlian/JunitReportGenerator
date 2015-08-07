require_relative 'helper'

class TestProperty < MiniTest::Unit::TestCase
  def test_xml_tag_name
    assert_equal('property', Property.xml_tag_name)
  end
end