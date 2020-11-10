require 'test_helper'

class Jb::AuthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jb_authors_url
    assert_response :success
  end

end
