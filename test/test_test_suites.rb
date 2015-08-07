require_relative 'helper'

class TestTestSuites < Minitest::Test
  def test_xml_tag_name
    assert_equal('testsuites', TestSuites.xml_tag_name)
  end
end