class SkillsController < ApplicationController
  before_action :authenticate_user!
  helper_method :user

  def index
  end

  def update
    if user == current_user
      user.topics = (params[:skills] || []).map {|x| Topic.find(x)}
    end
    redirect_to user_path(user.id)
  end

 private

    def user
      @user ||= User.find(user_id)
    end

    def user_id
      params.require(:user_id)
    end
end
