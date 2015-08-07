require_relative 'helper'

class TestError < MiniTest::Unit::TestCase
  def test_xml_tag_name
    assert_equal('error', Error.xml_tag_name)
  end
end