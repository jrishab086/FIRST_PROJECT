module Api
  class Api::ArticlesController < ApplicationController
    def index
      articles = Article.all
      render json: articles
    end

    def show
      article = Article.find(params[:id])
      render json: article
    end

    def create
      @article = Article.new(params.require(:article).permit(:title, :content))
      if @article.save
        render json: @article, status: :created
      else
        render json: @article.errors, status: :unprocessable_entity
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
  end
end
