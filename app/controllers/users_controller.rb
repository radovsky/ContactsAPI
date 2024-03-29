class UsersController < ApplicationController
  def index
    render :json => User.all
  end
  
  def create
    @user = User.new(user_params)
    # in Rails 4 you must whitelist attributes with #permit
    if @user.save
      render :json => @user
    else
      render :json => @user.errors.full_messages
    end
  end
  
  def show
    render :json => User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params) 
      render :json => @user
    else
      render :json => @user.errors.full_messages
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end