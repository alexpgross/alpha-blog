class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new #we intialize instance variables in the controller. That's just how rails works.
  end

  def create
    debugger
   @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was successfully created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end


  def show
    @article = Article.find(params[:id])
  end


  def edit
    @article = Article.find(params[:id])
  end

  def update
  @article = Article.find(params[:id])
     if @article.update(article_params)
      flash[:notice] = "Article was successfully updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
  @article = Article.find(params[:id])
  @article.destroy
    flash[:notice] = "Article was deleted"
    redirect_to articles_path


  end

  private
    def article_params
      params.require(:article).permit(:title,:description)
    end
end