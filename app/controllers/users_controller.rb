class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    articles = Article.all
    @articles = user.articles.order('created_at DESC').includes(:user).page(params[:page]).per(5)
  end
end
