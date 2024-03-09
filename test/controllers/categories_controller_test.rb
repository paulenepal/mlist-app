require "test_helper"

class TaskCategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user_one)
  end

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should get show" do
    get category_path(categories(:cat_one))
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should create a task category" do
    post categories_path, params: { category: { name: "New Task Cat" } }
    assert_redirected_to categories_path
  end

  test "should edit a task category" do
    get edit_category_path(categories(:cat_one))
    assert_response :success
  end

  test "should update a task category" do
    patch category_path(categories(:cat_one)), params: { category: {name: "New Name"}}
    assert_redirected_to categories_path
  end

  test "should delete a task category" do
    delete category_path(categories(:cat_one))
    assert_redirected_to categories_path
  end
end
