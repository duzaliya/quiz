require_relative "lib/question"
require_relative "lib/question_reader"
require_relative "lib/quiz"

file_name = File.join(__dir__, 'data', 'questions.xml')

questions = QuestionReader.from_xml(file_name)
quiz = Quiz.new(questions)

until quiz.finished?
  puts quiz.next_question
  question = quiz.question

  time = Time.now + question.response_time

  input = STDIN.gets.chomp

  time_new = Time.now
  if time < time_new
    puts "Время вышло!"
    break
  end

  if question.right_answer?(input)
    quiz.upscore
    puts "Верно!"
    puts "Вы набрали баллов: #{question.points}"
  else
    puts "Правильный ответ: #{question.answer}"
  end
  puts
end

puts
puts quiz.result
