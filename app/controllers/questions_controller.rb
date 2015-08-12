class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    4.times { @question.answers.build }
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      redirect_to root_path, notice: 'Question was successfully created.'
    else
      flash.now[:danger] = 'Required fields should be present'
      render :new
    end
  end

  def destroy
    @question.destroy
  end

  def show

  end

  private

  def question_params
    params.require(:question)
    .permit(:condition, :difficulty, :topic_id, \
            answers_attributes: [:id,:solution, :answer_valid, :_destroy])
  end
end
