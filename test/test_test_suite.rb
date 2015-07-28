require_relative 'helper'

class TestSuiteTest < MiniTest::Unit::TestCase
  def setup
    @test_suite = TestSuite.create('Sonar')
  end
  
  def test_create
    assert_equal('Sonar', @test_suite.instance_variable_get(:@name))
    assert_equal({:name => 'Sonar', :tests => 0}, @test_suite.attributes)
  end
  
  def test_empty_test_suite
    assert_equal(0, @test_suite.instance_variable_get(:@tests))
  end
  
  def test_add
    @test_suite.add(MiniTest::Mock.new).add(MiniTest::Mock.new)
    assert_equal(2, @test_suite.instance_variable_get(:@tests))
  end
end