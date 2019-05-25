class ArticlesController < ApplicationController
  def index
    @articles = Article.order('created_at DESC').includes(:user).page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(create_params)
    redirect_to root_path
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def create_params
    params.require(:article).permit(:title, :detail, :image).merge(user_id: current_user.id)
  end


end
