class PagesController < ApplicationController

  def welcome
  end

  def start
    @questions = QuestionQuiz.all.sample(2)
    @technologies = Technology.all.sample(3)
    @json_questions = @questions.to_json(:include => :answers)
  end

  def profile
  end
end
