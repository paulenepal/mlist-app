require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user_one)
  end

  test "should get show" do
    get task_path(tasks(:task_one))
    assert_response :success
  end

  test "should get new" do
    get new_category_task_path(category_id: categories(:cat_one).id)
    assert_response :success
  end

  test "should create a task" do
    post category_tasks_path(category_id: categories(:cat_one).id), params: { task: { name: "New Task" } }
    assert_redirected_to category_path(categories(:cat_one))
  end

  test "should edit a task" do
    get edit_task_path(tasks(:task_one))
    assert_response :success
  end

  test "should update a task" do
    patch task_path(tasks(:task_one)), params: { task: {name: "New Name"}}
    assert_redirected_to category_path(categories(:cat_one))
  end

  test "should delete a task" do
    delete task_path(tasks(:task_one))
    assert_redirected_to category_path(categories(:cat_one))
  end
end
