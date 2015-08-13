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
      redirect_to question_path(@question), notice: 'Question was successfully created.'
    else
      flash.now[:danger] = 'Required fields should be present'
      render :new
    end
  end

  def destroy
    @question.destroy
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.user != current_user
      redirect_to question_path(@question), notice: "You can only edit your own questions."
    end

    if @question.update(question_params)
      redirect_to question_path(@question), notice: 'Question was successfully updated.'
    else
      redirect_to question_path(@question), notice: 'Failed to update question.'
    end
  end

  def edit
    @question = Question.find(params[:id])

    if @question.user != current_user
      redirect_to question_path(@question), notice: "You can only edit questions you've created."
    end
  end

  private

  def question_params
    params.require(:question)
    .permit(:condition, :difficulty, :topic_id, \
            answers_attributes: [:id,:solution, :answer_valid, :_destroy])
  end


end
