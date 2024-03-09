require "test_helper"

class TaskCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save TaskCategory without name" do
    category = Category.new
    assert_not category.save, "Saved the TaskCategory without name"
  end

  test "should not save TaskCategory if name length > 20" do
    category = Category.new
    name = "This should not save. I am more than 20 characters."
    assert_not category.save, "Saved the TaskCategory with more than 20 chars."
  end

end
