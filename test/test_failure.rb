require_relative 'helper'

class TestFailure < MiniTest::Unit::TestCase
  def test_xml_tag_name
    assert_equal('failure', Failure.xml_tag_name)
  end
end