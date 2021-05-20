require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Travel")
  end

  test "should show categories listing" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.name #the show pages should follow this link
    assert_select "a[href=?]", category_path(@category2), text: @category2.name  #check for these 2 paths; want name of category
  end
end
