# typed: false
# frozen_string_literal: true
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new # creating an instance variable for the new view form to use the Type
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # Same as redirect_to user_url(@user)
    else
      render 'new' # renders new, but @user will be this object that failed to save so we can see errors.
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
