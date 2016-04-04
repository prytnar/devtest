require 'test_helper'

class PricingControllerTest < ActionDispatch::IntegrationTest
  test "should get evaluate_target" do
    get pricing_evaluate_target_url
    assert_response :success
  end

end
