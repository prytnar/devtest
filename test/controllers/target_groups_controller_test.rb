require 'test_helper'

class TargetGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @target_group = target_groups(:one)
  end

  test "should get index" do
    get target_groups_url
    assert_response :success
  end

  test "should create target_group" do
    assert_difference('TargetGroup.count') do
      post target_groups_url, params: { target_group: { external_id: @target_group.external_id, name: @target_group.name, parent_id: @target_group.parent_id, references: @target_group.references, secret_code: @target_group.secret_code } }
    end

    assert_response 201
  end

  test "should show target_group" do
    get target_group_url(@target_group)
    assert_response :success
  end

  test "should update target_group" do
    patch target_group_url(@target_group), params: { target_group: { external_id: @target_group.external_id, name: @target_group.name, parent_id: @target_group.parent_id, references: @target_group.references, secret_code: @target_group.secret_code } }
    assert_response 200
  end

  test "should destroy target_group" do
    assert_difference('TargetGroup.count', -1) do
      delete target_group_url(@target_group)
    end

    assert_response 204
  end
end
