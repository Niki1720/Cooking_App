class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    redirect_to recipes_path if user_signed_in?
  end

  def about
  end

end