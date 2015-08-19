require_relative 'helper'

class TestProperty < Minitest::Test
  def test_create
    property = Property.create('os.vendor', 'Macrohard Corporation')
    assert_equal({ name: 'os.vendor', value: 'Macrohard Corporation' }, property.attributes)
  end

  def test_xml_tag_name
    assert_equal('property', Property.xml_tag_name)
  end
end
