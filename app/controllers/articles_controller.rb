class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:show, :edit, :update, :destroy] #roda o set_article antes do que está abaixo
  
  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article updated"
      redirect_to @article
    else 
      render 'edit'
    end   
  end 

  def destroy 
    @article.destroy
    redirect_to articles_path #articles_path manda para o caminho dos articles
  end 

  private #private é que o que está abaixo é só para este controller, não deve ter um end no final dele

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end 