class PagesController < ApplicationController

  def welcome
  end

  def start
    @questions = QuestionQuiz.all.sample(2)
    @technologies = Technology.all.sample(3)
    respond_to do |format|
      format.html
      format.json { render :json => @questions.to_json(:include => :answers) }
    end
  end

  def profile
  end
end
