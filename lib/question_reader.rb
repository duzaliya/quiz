require "rexml/document"

class QuestionReader
  def self.from_xml(file_name)
    doc = REXML::Document.new(File.new(file_name))

    doc.get_elements("questions/question").map do |question_xml|
      Question.new(
        text: question_xml.elements["text"].text,
        variants: question_xml.get_elements("variants/variant").map(&:text).shuffle,
        answer: question_xml.get_elements("variants/variant").find { |variant| variant.attributes['right'] == 'true' }.text,
        points: question_xml.elements["points"].text.to_i,
        response_time: question_xml.elements["response_time"].text.to_i
      )
    end
  end
end
