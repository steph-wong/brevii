require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get movie" do
    get static_pages_movie_url
    assert_response :success
  end

end
