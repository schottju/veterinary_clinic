require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get dictionaries" do
    get :dictionaries
    assert_response :success
  end

end
