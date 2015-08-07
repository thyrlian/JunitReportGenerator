require_relative 'helper'

class TestSystemOut < Minitest::Test
  def test_xml_tag_name
    assert_equal('system-out', SystemOut.xml_tag_name)
  end
end