# JunitReportGenerator

[![Gem Version](https://badge.fury.io/rb/junit_report_generator.svg)](http://badge.fury.io/rb/junit_report_generator)
[![Build Status](https://travis-ci.org/thyrlian/JunitReportGenerator.svg?branch=master)](https://travis-ci.org/thyrlian/JunitReportGenerator)
[![Code Climate](https://codeclimate.com/github/thyrlian/JunitReportGenerator/badges/gpa.svg)](https://codeclimate.com/github/thyrlian/JunitReportGenerator)
[![Coverage Status](https://coveralls.io/repos/thyrlian/JunitReportGenerator/badge.svg?branch=master&service=github)](https://coveralls.io/github/thyrlian/JunitReportGenerator?branch=master)
[![Dependency Status](https://gemnasium.com/thyrlian/JunitReportGenerator.svg)](https://gemnasium.com/thyrlian/JunitReportGenerator)

Easy and flexible solution to generating JUnit test result report from any format of data.

## Usage
Install the library
```shell
gem install junit_report_generator
```

Example code snippets
```ruby
require 'junit_report_generator'

include JunitReportGenerator

test_suite_1 = TestSuite.create('Test Suite 1')
# you can add all at once
test_suite_1.add(TestCase.create('Test Case'), TestCase.create('Test Case'))

test_suite_2 = TestSuite.create('Test Suite 2')
# or chaining add methods one after another
test_suite_2.add(TestCase.create('Test Case')).add(TestCase.create('Test Case'))

test_suites = TestSuites.create.add(test_suite_1, test_suite_2)

Report.on(test_suites).publish('[path_of_output_xml_test_results]')
```

## Syntax
* Add sub-elements to test case / suite(s)
```ruby
TestCase.create('test').add(sub_element_1, sub_element_2).add(sub_element_3)
```
* Add attribute(s) to any xml element (attribute methods are dynamically defined)
```ruby
TestCase.create('test').attribute('value').whatever_you_want('foo')
```
* Test case result format: Pass, Failure, Error, Skipped.
```ruby
TestCase.create('test')                      # Pass: no sub-element
TestCase.create('test').add(Failure.create)  # Failure
TestCase.create('test').add(Error.create)    # Error
TestCase.create('test').add(Skipped.create)  # Skipped
```

## Utilization
Jenkins -> Job -> Configure -> Post-build Actions -> Add post-build action -> Publish JUnit test result report -> Test report XMLs

## Notes
The statistics attributes in testsuite(s) are not really used by Jenkins (they are optional), in fact, Jenkins is doing the math by itself via counting the numbers from each testcase.
```xml
<!-- these attributes are optional -->
<testsuite name="foobar" tests="10" errors="3" failures="2" skipped="1" time="12.34">
```

## Reference
[JUnit test reports specification](https://svn.jenkins-ci.org/trunk/hudson/dtkit/dtkit-format/dtkit-junit-model/src/main/resources/com/thalesgroup/dtkit/junit/model/xsd/)

## License

Copyright (c) 2015 Jing Li

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
