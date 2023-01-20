class Quiz
  attr_accessor :question

  def initialize(questions)
    @questions = questions
    @question = nil
    @question_number = 0
    @answers = 0
    @results = 0
  end

  def next_question
    @question = @questions[@question_number]
    @question_number += 1
    @question
  end

  def result
    <<~RESULT
      Правильных ответов: #{@answers} из #{@questions.size}
      Набрано баллов: #{@results}
    RESULT
  end

  def upscore
    @answers += 1
    @results += question.points
  end

  def finished?
    @question_number == @questions.size
  end
end
