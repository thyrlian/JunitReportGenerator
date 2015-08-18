require_relative 'helper'

class TestSystemErr < Minitest::Test
  def test_xml_tag_name
    assert_equal('system-err', SystemErr.xml_tag_name)
  end
end
