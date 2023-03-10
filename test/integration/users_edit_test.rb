require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:nivetha)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    log_in_as(@user)

    patch user_path(@user), params: {user: { name: "",
                                     email: "user@invalid",
                                     password:             "foo",
                                     password_confirmation: "bar" }}
    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: {user: { name: name,
                                             email: email,
                                             password:             "",
                                             password_confirmation: ""}}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email

    
  end
end


