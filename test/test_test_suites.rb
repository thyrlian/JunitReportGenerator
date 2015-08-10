require_relative 'helper'

class TestTestSuites < Minitest::Test
  def setup
    @test_suite_1 = MiniTest::Mock.new
    @test_suite_2 = MiniTest::Mock.new
    @test_suite_3 = MiniTest::Mock.new
    @test_suite_4 = MiniTest::Mock.new
    @test_suite_5 = MiniTest::Mock.new
    @test_suite_6 = MiniTest::Mock.new
    @test_suite_7 = MiniTest::Mock.new
    @test_suite_8 = MiniTest::Mock.new
  end
  
  def test_create
    test_suites = TestSuites.create
    assert_equal([], test_suites.sub_elements)
  end
  
  def test_xml_tag_name
    assert_equal('testsuites', TestSuites.xml_tag_name)
  end
  
  def test_register_block
    @test_suite_1.expect(:attributes, {:tests => 5, :failures => 1, :time => 60})
    @test_suite_2.expect(:attributes, {})
    @test_suite_3.expect(:attributes, {:tests => 0, :errors => 0, :failures => 0, :disabled => 0, :time => 0})
    @test_suite_4.expect(:attributes, {:tests => 10, :errors => 2, :failures => 0, :disabled => 0, :time => 100})
    @test_suite_5.expect(:attributes, {:tests => 5, :errors => 0, :failures => 0, :disabled => 2, :time => 50.078})
    @test_suite_6.expect(:attributes, {:tests => 3, :errors => 1, :failures => 1, :disabled => 1, :time => 10.0009})
    @test_suite_7.expect(:attributes, {:tests => 6, :errors => 2, :failures => 2, :time => 0})
    @test_suite_8.expect(:attributes, {:tests => 1, :errors => 0, :failures => 0, :disabled => 0, :time => 4.6})
    
    test_suites = TestSuites.create
    test_suites.add(@test_suite_1, @test_suite_2, @test_suite_3, @test_suite_4, @test_suite_5, @test_suite_6, @test_suite_7, @test_suite_8)
    
    assert_equal(30, test_suites.attributes[:tests])
    assert_equal(5, test_suites.attributes[:errors])
    assert_equal(4, test_suites.attributes[:failures])
    assert_equal(3, test_suites.attributes[:disabled])
    assert_in_delta(224.6789, test_suites.attributes[:time], 0.00001)
  end
end