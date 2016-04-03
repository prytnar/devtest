require 'test_helper'

class LocationGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_group = location_groups(:one)
  end

  test "should get index" do
    get location_groups_url
    assert_response :success
  end

  test "should create location_group" do
    assert_difference('LocationGroup.count') do
      post location_groups_url, params: { location_group: { name: @location_group.name, references: @location_group.references, references: @location_group.references } }
    end

    assert_response 201
  end

  test "should show location_group" do
    get location_group_url(@location_group)
    assert_response :success
  end

  test "should update location_group" do
    patch location_group_url(@location_group), params: { location_group: { name: @location_group.name, references: @location_group.references, references: @location_group.references } }
    assert_response 200
  end

  test "should destroy location_group" do
    assert_difference('LocationGroup.count', -1) do
      delete location_group_url(@location_group)
    end

    assert_response 204
  end
end
