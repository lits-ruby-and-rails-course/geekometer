class PagesController < ApplicationController

  def welcome
  end

  def start
    @questions = Question.all
  end

  def profile
  end
end
