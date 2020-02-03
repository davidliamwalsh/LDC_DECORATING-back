class Admin::NewsArticlesController < Admin::ApplicationController
  before_action :find_news_article, only: [:show, :edit, :update, :destroy]

  def new
    @news_article = NewsArticle.new
  end

  def show
  end

  def edit
  end

  def index
    @news_articles = NewsArticle.order(:name).page(params[:page])
  end

  def create
    @news_article = NewsArticle.new(news_article_params)
    @news_article.image.attach(news_article_params[:image])

    if @news_article.save
      redirect_to admin_news_articles_path, status: :found, notice: "News Article successfully created!"
    else
      render :new 
    end
  end

  def update
    @news_article.attributes = news_article_params
    
    if @news_article.save
      redirect_to admin_news_articles_path, notice: "News Article successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @news_article.destroy

    redirect_to admin_news_articles_path, notice: "News Article successfully deleted!"
  end

  private

  def news_article_params
    params.require(:news_article).permit(:name, :body, :image)
  end

  def find_news_article
    @news_article = NewsArticle.friendly.find(params[:id])
  end

end