class Question
  attr_reader :text, :variants, :answer, :points, :response_time

  def initialize(params)
    @text = params[:text]
    @variants = params[:variants]
    @answer = params[:answer]
    @points = params[:points]
    @response_time = params[:response_time]
  end

  def to_s
    <<~QUESTION
      #{@text} (#{@points} баллов)
      На ответ дается #{@response_time} секунд.

      #{@variants.join("\n")}
      
    QUESTION
  end

  def right_answer?(user_input)
    user_input.downcase == @answer.downcase
  end
end
