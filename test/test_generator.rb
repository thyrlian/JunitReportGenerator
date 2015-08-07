require_relative 'helper'

class TestGenerator < Minitest::Test
  def test_produce
    test_suites = TestSuites.create
    test_suite = TestSuite.create('UI-Tests')
    test_suite.add(TestCase.create('testHome').classname('HomeActivityTest').time('2.081'))
      .add(TestCase.create('testLoginWithCorrectCredentials').classname('LoginActivityTest').time('7.472'))
      .add(TestCase.create('testLoginWithWrongCredentials').classname('LoginActivityTest').time('6.691'))
    test_suites.add(test_suite)
    xml = Generator.produce(test_suites)
    doc = Nokogiri::Slop(xml)
    
    assert_equal(3, doc.testsuites.testsuite.testcase.size)
    assert_equal('testLoginWithWrongCredentials', doc.testsuites.testsuite.testcase.last['name'])
    assert_equal('LoginActivityTest', doc.testsuites.testsuite.testcase.last['classname'])
    assert_equal('6.691', doc.testsuites.testsuite.testcase.last['time'])
  end
end