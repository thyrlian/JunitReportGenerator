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
  
  def test_build_tags_without_recursion
    xml = Nokogiri::XML::Builder.new do |xml|
      Generator.send(:build_tags, xml, TestSuites.create)
    end.to_xml
    
    assert(Nokogiri::XML(xml).xpath('//testsuites').children.empty?)
  end
  
  def test_build_tags_with_sub_elements
    test_suites = TestSuites.create
    test_suite = TestSuite.create('UI-Tests')
    test_suite.add(TestCase.create('testHome').classname('HomeActivityTest').time('2.081'))
      .add(TestCase.create('testLoginWithCorrectCredentials').classname('LoginActivityTest').time('7.472'))
      .add(TestCase.create('testLoginWithWrongCredentials').classname('LoginActivityTest').time('6.691'))
    test_suites.add(test_suite)
    
    xml = Nokogiri::XML::Builder.new do |xml|
      Generator.send(:build_tags, xml, test_suites)
    end.to_xml
    
    assert(!Nokogiri::XML(xml).xpath('//testsuites').children.empty?)
    assert_equal(3, Nokogiri::XML(xml).xpath('//testcase').size)
  end
end