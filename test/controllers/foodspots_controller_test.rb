require 'test_helper'

class FoodspotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get foodspots_index_url
    assert_response :success
  end

  test "should get show" do
    get foodspots_show_url
    assert_response :success
  end

  test "should get create" do
    get foodspots_create_url
    assert_response :success
  end

  test "should get edit" do
    get foodspots_edit_url
    assert_response :success
  end

  test "should get delete" do
    get foodspots_delete_url
    assert_response :success
  end

end
