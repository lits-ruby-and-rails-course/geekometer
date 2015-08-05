class UsersController < ApplicationController
  include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  before_action :authenticate_user!
  before_action :set_user, only: [:new,  :show, :edit, :update, :destroy,:user_params]

  # GET /users
    def index
    @users = User.all
   end

  def show

  end

#  # GET /users/1/edit
  def edit

  end
#
#  # POST /users
 def create
   @user = User.new(user_params)
#
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end
#
#  # PATCH/PUT /users/1
  def update
    @user=User.find(params[:id])
    @user.avatar = params[:user][:avatar]
    @user.username = params[:user][:username]
    @user.save!
    @user.avatar.store!

    respond_to do |format|
      if @user.save!
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }

      end
    end
  end
#
#  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end
#
  private
#    # Use callbacks to share common setup or constraints between actions.
   def set_user
     if params[:id]
     then
       @user = User.find(params[:id])
     else
       @user = current_user
     end
   end
#
#    # Only allow a trusted parameter "white list" through.
   def user_params
   #     params[:user]
     params[:User]
   end
end
