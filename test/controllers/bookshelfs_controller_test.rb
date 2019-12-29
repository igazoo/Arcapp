require 'test_helper'

class BookshelfsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookshelfs_new_url
    assert_response :success
  end

end
