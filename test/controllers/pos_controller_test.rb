require 'test_helper'

class PosControllerTest < ActionController::TestCase
  test "should get calculator" do
    get :calculator
    assert_response :success
  end

end
