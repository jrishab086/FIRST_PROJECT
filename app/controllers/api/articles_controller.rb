module Api
  class Api::ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_article1, only: [:destroy]
    def index
      render json: Article.all
    end

    def show
      article = Article.find(params[:id])
      render json: article
    end

    def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
    end
  end
    def update
      @article = Article.find(params[:id])
      if @article.update(params.require(:article).permit(:title, :content))
        render json: @article
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end
    def destroy
    @article.destroy
    render json: { message: "Article deleted successfully" }, status: :ok
    end
  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
  def set_article1
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Article not found" }, status: :not_found
  end
end
end
