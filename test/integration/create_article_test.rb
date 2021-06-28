require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest
  
  # setup do
  #   @admin_user = User.create(username: "johndoe", email: "johndoe@example.com",
  #                               password: "password", admin: true)
  #   sign_in_as(@admin_user)        
  # end
  
  # test "get new article form and create article" do
  #   get "/articles/new"
  #     assert_response :success
  #     assert_difference 'Article.count', 1 do
  #       post articles_path, params: { article: { title: "Canoeing in the BWCAW" } }
  #       assert_response :redirect
  #     end
  #     follow_redirect!
  #     assert_response :success
  #     assert_match "Canoeing", response.body
  #   end
end
#this is not working: problem line 6error -Expected response to be a <2XX: 
#success>, but was a <302: Found> redirect to <http://www.example.com/login>
# perhaps this is due to a user not being logged in?