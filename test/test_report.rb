require_relative 'helper'

class TestReport < Minitest::Test
  def setup
    @test_suites = MiniTest::Mock.new
    @report = Report.on(@test_suites)
    @file = MiniTest::Mock.new
  end

  def test_on
    @test_suites.expect(:nil?, false)
    @test_suites.expect(:==, true, [@test_suites])
    assert_equal(@test_suites, @report.instance_variable_get(:@test_suites))
  end

  def test_publish
    xml = 'Pseudo XML'
    Generator.stub(:produce, xml) do
      File.stub(:open, '', @file) do
        @file.expect(:puts, '', [xml])
        @report.publish(@file)
      end
    end
  end
end
