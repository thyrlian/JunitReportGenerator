require_relative 'helper'

class TestSystemErr < MiniTest::Unit::TestCase
  def test_xml_tag_name
    assert_equal('system-err', SystemErr.xml_tag_name)
  end
end