require "test_helper"

class Api::V1::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_article = api_v1_articles(:one)
  end

  test "should get index" do
    get api_v1_articles_url, as: :json
    assert_response :success
  end

  test "should create api_v1_article" do
    assert_difference('Api::V1::Article.count') do
      post api_v1_articles_url, params: { api_v1_article: { content: @api_v1_article.content, title: @api_v1_article.title } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_article" do
    get api_v1_article_url(@api_v1_article), as: :json
    assert_response :success
  end

  test "should update api_v1_article" do
    patch api_v1_article_url(@api_v1_article), params: { api_v1_article: { content: @api_v1_article.content, title: @api_v1_article.title } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_article" do
    assert_difference('Api::V1::Article.count', -1) do
      delete api_v1_article_url(@api_v1_article), as: :json
    end

    assert_response 204
  end
end
