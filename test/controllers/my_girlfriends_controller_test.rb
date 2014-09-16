require 'test_helper'

class MyGirlfriendsControllerTest < ActionController::TestCase
  setup do
    @my_girlfriend = my_girlfriends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_girlfriends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_girlfriend" do
    assert_difference('MyGirlfriend.count') do
      post :create, my_girlfriend: { favorite_food: @my_girlfriend.favorite_food, hometown: @my_girlfriend.hometown, name: @my_girlfriend.name, what_turns_me_on: @my_girlfriend.what_turns_me_on, where_we_met: @my_girlfriend.where_we_met }
    end

    assert_redirected_to my_girlfriend_path(assigns(:my_girlfriend))
  end

  test "should show my_girlfriend" do
    get :show, id: @my_girlfriend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_girlfriend
    assert_response :success
  end

  test "should update my_girlfriend" do
    patch :update, id: @my_girlfriend, my_girlfriend: { favorite_food: @my_girlfriend.favorite_food, hometown: @my_girlfriend.hometown, name: @my_girlfriend.name, what_turns_me_on: @my_girlfriend.what_turns_me_on, where_we_met: @my_girlfriend.where_we_met }
    assert_redirected_to my_girlfriend_path(assigns(:my_girlfriend))
  end

  test "should destroy my_girlfriend" do
    assert_difference('MyGirlfriend.count', -1) do
      delete :destroy, id: @my_girlfriend
    end

    assert_redirected_to my_girlfriends_path
  end
end
