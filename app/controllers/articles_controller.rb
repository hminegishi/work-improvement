class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def article_params
    params.require(:article).permit(:content, :image).merge(user_id: current_user.id)
  end
end
