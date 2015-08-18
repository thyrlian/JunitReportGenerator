require 'nokogiri'

module JunitReportGenerator
  class Generator
    class << self
      def produce(test_suites)
        builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
          build_tags(xml, test_suites)
        end
        builder.to_xml
      end

      def build_tags(xml, element)
        tag_name = element.class.xml_tag_name
        xml.send(tag_name, element.attributes) do
          if element.respond_to?(:sub_elements)
            element.sub_elements.each do |sub_element|
              build_tags(xml, sub_element)
            end
          end
        end
      end
    end

    private_class_method :new, :build_tags
  end
end
