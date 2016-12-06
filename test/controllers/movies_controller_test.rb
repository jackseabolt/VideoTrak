require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get movies_new_url
    assert_response :success
  end

  test "should get create" do
    get movies_create_url
    assert_response :success
  end

end
