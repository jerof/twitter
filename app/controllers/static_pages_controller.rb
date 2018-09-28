class StaticPagesController < ApplicationController
  def home
    redirect_to tweets_path if logged_in?
  end

  def about
  end

  def help
  end

  def privacy
  end
end
