class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @articles = Article.all.includes(:user).order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def edit
    @article = Article.find(params[:id])
    unless @article.user_id == current_user.id 
      redirect_to action: :index
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article.id), method: :get
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to root_path
  end

  def search
    @articles = Article.search(params[:keyword])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, :category_id).merge(user_id: current_user.id)
  end

end
