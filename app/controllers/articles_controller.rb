class ArticlesController < ApplicationController

  def new
    @article = Article.new #we intialize instance variables in the controller. That's just how rails works.
  end

  def create
   # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    redirect_to_articles_show(@article)
  end

  private
    def article_params
      params.require(:article).permit(:title,:description)
    end
end