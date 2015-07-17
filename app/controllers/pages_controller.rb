class PagesController < ApplicationController

  def welcome
  end

  def start
    @questions = QuestionQuiz.all.sample(2)
    @technologies = Technology.all.sample(3)
  end

  def profile
  end
end
