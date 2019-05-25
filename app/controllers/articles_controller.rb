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

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
    redirect_to root_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(create_params) if @article.user_id == current_user.id
    redirect_to root_path
  end

  private
  def create_params
    params.require(:article).permit(:title, :detail, :image).merge(user_id: current_user.id)
  end


end
