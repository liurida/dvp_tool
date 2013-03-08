require 'test_helper'

class DvpsControllerTest < ActionController::TestCase
  setup do
    @dvp = dvps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dvps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dvp" do
    assert_difference('Dvp.count') do
      post :create, dvp: { check_method: @dvp.check_method, check_type: @dvp.check_type, description: @dvp.description, memo: @dvp.memo, proc_name: @dvp.proc_name, query_message: @dvp.query_message, review_type: @dvp.review_type, seq_num: @dvp.seq_num }
    end

    assert_redirected_to dvp_path(assigns(:dvp))
  end

  test "should show dvp" do
    get :show, id: @dvp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dvp
    assert_response :success
  end

  test "should update dvp" do
    put :update, id: @dvp, dvp: { check_method: @dvp.check_method, check_type: @dvp.check_type, description: @dvp.description, memo: @dvp.memo, proc_name: @dvp.proc_name, query_message: @dvp.query_message, review_type: @dvp.review_type, seq_num: @dvp.seq_num }
    assert_redirected_to dvp_path(assigns(:dvp))
  end

  test "should destroy dvp" do
    assert_difference('Dvp.count', -1) do
      delete :destroy, id: @dvp
    end

    assert_redirected_to dvps_path
  end
end
