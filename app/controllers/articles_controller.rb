class ArticlesController < ApplicationController
  
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article updated"
      redirect_to @article
    else 
      render 'edit'
    end   
  end 

  def destroy 
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path #articles_path manda para o caminho dos articles
  end 

end 