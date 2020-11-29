# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  # show user info
  def show
    @user = User.find(params[:id])
  end

  # form for creating new user
  def new
    @user = User.new # creating an instance variable for the new view form to use the Type
  end

  # handling POST to create a new user
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # Same as redirect_to user_url(@user)

    else
      render 'new'
      # renders new, but @user will be this object that failed to save so we can see errors.
      # as render just will load the appropriate view without a new http request unlike redirect
    end
  end

  # show user edit form
  def edit
    @user = User.find(params[:id])
  end

  # PATCH user with updated information
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "You must be logged in to do that."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id]) # Set @user to User that corresponds to the the id parameter in the request
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
