require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  test 'user can see their tasks' do
    session[:user_id] = users(:ada)
    get :show, id: tasks(:adas_task)

    assert_response(:success)

  end

  test 'user cannot see others\' tasks' do
    session[:user_id] = users(:babbage)
    get :show, id: tasks(:adas_task)

    assert_response(:redirect)
    assert_equal(flash[:notice], "Girl that aint yo task")

  end






  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
