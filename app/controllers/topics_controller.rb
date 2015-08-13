class TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @questions = @topic.questions.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to root_path, notice: 'Topic was successfully created.'
    else
      flash.now[:danger] = 'Name and description fields should be present'
      render :new
    end
  end

 private

    def topic_params
      params.require(:topic).permit(:name, :description, :logo)
    end
end
