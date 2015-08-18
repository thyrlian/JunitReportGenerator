require_relative 'helper'

class TestSkipped < Minitest::Test
  def test_xml_tag_name
    assert_equal('skipped', Skipped.xml_tag_name)
  end
end
