# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "You must be logged in to do that."
      redirect_to(login_url)
    end
  end
end
