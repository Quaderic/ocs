class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    #@user = User.new(params[:user])
 @user = User.new(user_params)
    if @user.save
      render 'show'
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(1)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
