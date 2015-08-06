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

    if @question.save
      redirect_to question_path(@question), notice: 'Question was successfully created.'
    else
      flash.now[:danger] = 'Required fields should be present'
      render :new
    end
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    params.require(:question)
    .permit(:condition, :difficulty, :topic_id, \
            answers_attributes: [:id,:solution, :answer_valid, :_destroy])
  end

  def show
    @question = Question.find(params[:id])
  end
end
