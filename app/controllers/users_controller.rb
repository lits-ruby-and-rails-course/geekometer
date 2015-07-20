class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new,  :show, :edit, :update, :destroy,:user_params]

  # GET /users
    def index
    @users = User.all
   end

  # GET /users/1
  def show

  end
#
#  # GET /users/new
  def new
    @User = User.new
  end
#
#  # GET /users/1/edit
  def edit

  end
#
#  # POST /users
 def create
   @User = User.new(user_params)
#
    if @User.save
      redirect_to @User, notice: 'User was successfully created.'
    else
      render :new
    end
  end
#
#  # PATCH/PUT /users/1
  def update
    @User=User.find(params[:id])
#    @User.avatar.store!
    @User.avatar = params[:user][:avatar]
    @User.username = params[:user][:username]

#
#   @User.save!

    respond_to do |format|
      if @User.save!
        format.html { redirect_to @User, notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }

      end
    end
  end
#
#  # DELETE /users/1
    def destroy
      @User.destroy
  redirect_to users_url, notice: 'User was successfully destroyed.'
  end
#
  private
#    # Use callbacks to share common setup or constraints between actions.
   def set_user
     @User=User.find(params[:id])
   end
#
#    # Only allow a trusted parameter "white list" through.
   def user_params
   #     params[:user]
     params[:User]
   end
end