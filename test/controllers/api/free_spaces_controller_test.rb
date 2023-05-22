require "test_helper"

class Api::FreeSpacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_free_spaces_index_url
    assert_response :success
  end
end
