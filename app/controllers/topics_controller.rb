class TopicsController < ApplicationController
  before_action :authenticate_user!

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
      params.require(:topic).permit(:name, :description)
    end
end
