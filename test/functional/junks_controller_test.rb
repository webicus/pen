require 'test_helper'

class JunksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:junks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create junk" do
    assert_difference('Junk.count') do
      post :create, :junk => { }
    end

    assert_redirected_to junk_path(assigns(:junk))
  end

  test "should show junk" do
    get :show, :id => junks(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => junks(:one).id
    assert_response :success
  end

  test "should update junk" do
    put :update, :id => junks(:one).id, :junk => { }
    assert_redirected_to junk_path(assigns(:junk))
  end

  test "should destroy junk" do
    assert_difference('Junk.count', -1) do
      delete :destroy, :id => junks(:one).id
    end

    assert_redirected_to junks_path
  end
end
