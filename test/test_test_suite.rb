require_relative 'helper'

class TestTestSuite < Minitest::Test
  def setup
    @test_suite = TestSuite.create('Sonar')
    @test_case_1 = MiniTest::Mock.new
    @test_case_2 = MiniTest::Mock.new
    @test_case_3 = MiniTest::Mock.new
    @test_case_4 = MiniTest::Mock.new
    @test_case_5 = MiniTest::Mock.new
    @test_case_6 = MiniTest::Mock.new
    @test_case_7 = MiniTest::Mock.new
    @test_case_8 = MiniTest::Mock.new
  end
  
  def test_create
    assert_equal('Sonar', @test_suite.instance_variable_get(:@name))
    assert_equal('Sonar', @test_suite.attributes[:name])
    assert_equal(0, @test_suite.attributes[:tests])
    assert_equal([], @test_suite.sub_elements)
  end
  
  def test_empty_test_suite
    assert_equal(0, @test_suite.instance_variable_get(:@tests))
  end
  
  def test_add_by_splatting_arguments
    @test_case_1.expect(:is_a?, true, [TestCase])
    @test_case_2.expect(:is_a?, true, [TestCase])
    @test_case_3.expect(:is_a?, true, [TestCase])
    @test_case_1.expect(:sub_elements, [])
    @test_case_2.expect(:sub_elements, [])
    @test_case_3.expect(:sub_elements, [])
    @test_case_1.expect(:attributes, {})
    @test_case_2.expect(:attributes, {})
    @test_case_3.expect(:attributes, {})
    @test_suite.add(@test_case_1, @test_case_2, @test_case_3)
    assert_equal(3, @test_suite.instance_variable_get(:@tests))
  end
  
  def test_add_by_chaining
    @test_case_1.expect(:is_a?, true, [TestCase])
    @test_case_2.expect(:is_a?, true, [TestCase])
    @test_case_1.expect(:sub_elements, [])
    @test_case_2.expect(:sub_elements, [])
    @test_case_1.expect(:attributes, {})
    @test_case_2.expect(:attributes, {})
    @test_suite.add(@test_case_1).add(@test_case_2)
    assert_equal(2, @test_suite.instance_variable_get(:@tests))
  end
  
  def test_xml_tag_name
    assert_equal('testsuite', TestSuite.xml_tag_name)
  end
  
  def test_register_block
    sub_element = MiniTest::Mock.new
    
    @test_case_1.expect(:is_a?, true, [TestCase])
    @test_case_2.expect(:is_a?, true, [TestCase])
    @test_case_3.expect(:is_a?, true, [TestCase])
    @test_case_4.expect(:is_a?, true, [TestCase])
    @test_case_5.expect(:is_a?, true, [TestCase])
    @test_case_6.expect(:is_a?, true, [TestCase])
    @test_case_7.expect(:is_a?, true, [TestCase])
    @test_case_8.expect(:is_a?, true, [TestCase])
    sub_element.expect(:is_a?, false, [TestCase])
    
    @test_case_1.expect(:attributes, {:time => '200.36'})
    @test_case_2.expect(:attributes, {:time => '1000.0'})
    @test_case_3.expect(:attributes, {:time => 0.00080})
    @test_case_4.expect(:attributes, {:time => '0.00009'})
    @test_case_5.expect(:attributes, {:time => '30s'})
    @test_case_6.expect(:attributes, {:time => '4.2'})
    @test_case_7.expect(:attributes, {})
    @test_case_8.expect(:attributes, {:time => '0.0070'})
    
    @test_case_1.expect(:sub_elements, [Failure.create])
    @test_case_2.expect(:sub_elements, [])
    @test_case_3.expect(:sub_elements, [Properties.create, Error.create])
    @test_case_4.expect(:sub_elements, [SystemOut.create])
    @test_case_5.expect(:sub_elements, [SystemOut.create, SystemErr.create, Failure.create])
    @test_case_6.expect(:sub_elements, [Skipped.create])
    @test_case_7.expect(:sub_elements, [Failure.create])
    @test_case_8.expect(:sub_elements, [Error.create, Properties.create])
    
    @test_suite.add(@test_case_1, @test_case_2, @test_case_3, @test_case_4, @test_case_5, @test_case_6, @test_case_7, @test_case_8, sub_element)
    
    assert_equal(8, @test_suite.attributes[:tests])
    assert_equal(2, @test_suite.attributes[:errors])
    assert_equal(3, @test_suite.attributes[:failures])
    assert_equal(1, @test_suite.attributes[:skipped])
    assert_in_delta(1234.56789, @test_suite.attributes[:time], 0.000001)
  end
end
