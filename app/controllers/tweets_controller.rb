class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      flash[:success] = "Hurrah! Your tweet was created!"
      redirect_to tweet_path(@tweet)
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @tweet.update(tweet_params)
      flash[:success] = "Your tweet was updated!"
      redirect_to tweet_path(@tweet)
    else
      render 'edit'
    end
  end

  def destroy
    @tweet.destroy
    flash[:danger] = "Your tweet was deleted!"
    redirect_to tweets_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def require_same_user
    if current_user != @tweet.user
      flash[:danger] = "You can only edit or delete your own article"
      redirect_to root_path
    end
  end
end
