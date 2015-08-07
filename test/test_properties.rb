require_relative 'helper'

class TestProperties < MiniTest::Unit::TestCase
  def test_xml_tag_name
    assert_equal('properties', Properties.xml_tag_name)
  end
end