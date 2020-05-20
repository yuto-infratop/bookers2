require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get _list" do
    get books__list_url
    assert_response :success
  end

end
