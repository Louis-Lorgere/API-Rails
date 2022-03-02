class Api::V1::ArticlesController < ApplicationController
  before_action :set_api_v1_article, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :is_admin?, only: %i[destroy update edit]
  # GET /api/v1/articles
  def index
    @api_v1_articles = Api::V1::Article.all

    render json: @api_v1_articles
  end

  # GET /api/v1/articles/1
  def show
    render json: @api_v1_article
  end

  # POST /api/v1/articles
  def create
    @api_v1_article = Api::V1::Article.new(api_v1_article_params)
    @api_v1_article.user_id= current_user.id

    if @api_v1_article.save
      render json: @api_v1_article, status: :created, location: @api_v1_article
    else
      render json: @api_v1_article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/articles/1
  def update
    if @api_v1_article.update(api_v1_article_params)
      render json: @api_v1_article
    else
      render json: @api_v1_article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/articles/1
  def destroy
    @api_v1_article.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_article
      @api_v1_article = Api::V1::Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_article_params
      params.require(:api_v1_article).permit(:title, :content)
    end

    def is_admin?
      if @api_v1_article.user_id != current_user.id
       render json: { error: 'Unauthorized', detail: "Not Your article" }
      end
    end
end
