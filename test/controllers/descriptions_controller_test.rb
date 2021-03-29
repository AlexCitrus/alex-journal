require "test_helper"

class DescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @description = descriptions(:one)
  end

  test "should get index" do
    get descriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_description_url
    assert_response :success
  end

  test "should create description" do
    assert_difference('Description.count') do
      post descriptions_url, params: { description: { task_id: @description.task_id } }
    end

    assert_redirected_to description_url(Description.last)
  end

  test "should show description" do
    get description_url(@description)
    assert_response :success
  end

  test "should get edit" do
    get edit_description_url(@description)
    assert_response :success
  end

  test "should update description" do
    patch description_url(@description), params: { description: { task_id: @description.task_id } }
    assert_redirected_to description_url(@description)
  end

  test "should destroy description" do
    assert_difference('Description.count', -1) do
      delete description_url(@description)
    end

    assert_redirected_to descriptions_url
  end
end
