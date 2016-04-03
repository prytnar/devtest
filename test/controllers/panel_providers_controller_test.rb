require 'test_helper'

class PanelProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @panel_provider = panel_providers(:one)
  end

  test "should get index" do
    get panel_providers_url
    assert_response :success
  end

  test "should create panel_provider" do
    assert_difference('PanelProvider.count') do
      post panel_providers_url, params: { panel_provider: { code: @panel_provider.code } }
    end

    assert_response 201
  end

  test "should show panel_provider" do
    get panel_provider_url(@panel_provider)
    assert_response :success
  end

  test "should update panel_provider" do
    patch panel_provider_url(@panel_provider), params: { panel_provider: { code: @panel_provider.code } }
    assert_response 200
  end

  test "should destroy panel_provider" do
    assert_difference('PanelProvider.count', -1) do
      delete panel_provider_url(@panel_provider)
    end

    assert_response 204
  end
end
