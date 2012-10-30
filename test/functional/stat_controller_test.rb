require 'test_helper'

class StatControllerTest < ActionController::TestCase
  test "should get inventor_bar" do
    get :inventor_bar
    assert_response :success
  end

end
