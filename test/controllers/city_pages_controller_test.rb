require 'test_helper'

class CityPagesControllerTest < ActionController::TestCase
  setup do
    @city_page = city_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:city_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create city_page" do
    assert_difference('CityPage.count') do
      post :create, city_page: { article: @city_page.article, book_suggestion: @city_page.book_suggestion, city: @city_page.city, continent: @city_page.continent, country: @city_page.country, g_map: @city_page.g_map, twitter_feed: @city_page.twitter_feed }
    end

    assert_redirected_to city_page_path(assigns(:city_page))
  end

  test "should show city_page" do
    get :show, id: @city_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @city_page
    assert_response :success
  end

  test "should update city_page" do
    patch :update, id: @city_page, city_page: { article: @city_page.article, book_suggestion: @city_page.book_suggestion, city: @city_page.city, continent: @city_page.continent, country: @city_page.country, g_map: @city_page.g_map, twitter_feed: @city_page.twitter_feed }
    assert_redirected_to city_page_path(assigns(:city_page))
  end

  test "should destroy city_page" do
    assert_difference('CityPage.count', -1) do
      delete :destroy, id: @city_page
    end

    assert_redirected_to city_pages_path
  end
end
