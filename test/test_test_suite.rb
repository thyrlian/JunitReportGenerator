require_relative 'helper'

class TestTestSuite < Minitest::Test
  def setup
    @test_suite = TestSuite.create('Sonar')
    @test_case_1 = MiniTest::Mock.new
    @test_case_2 = MiniTest::Mock.new
    @test_case_3 = MiniTest::Mock.new
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
end