require_relative 'helper'

class TestSuiteTest < Minitest::Test
  def setup
    @test_suite = TestSuite.new('Sonar')
  end
  
  def test_empty_test_suite
    assert_equal(0, @test_suite.tests)
  end
  
  def test_add
    @test_suite.add(mock()).add(mock())
    assert_equal(2, @test_suite.tests)
  end
end