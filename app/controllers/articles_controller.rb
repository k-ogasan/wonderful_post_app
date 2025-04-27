class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_article, only: %i[edit update destroy ]
require'pry'
  # GET /articles
  def index
    # @articles = Article.page(params[:page]).per(10)
    articles = Article.all
    articles = articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    @articles = articles.page params[:page]
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    # binding.pry
    @article = Article.new
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # POST /articles
  def create

    # @article = current_user.Article.new(article_params)
    @article = current_user.articles.build(article_params)
    # binding.prys
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
      # puts @article.errors.full_messages
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Article was successfully destroyed."
  end

  private
    def set_article
      # @article = Article.find(params[:id])
      @article = current_user.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end
end
