require 'test_helper'

class ContactUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_user = contact_users(:one)
  end

  test "should get index" do
    get contact_users_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_user_url
    assert_response :success
  end

  test "should create contact_user" do
    assert_difference('ContactUser.count') do
      post contact_users_url, params: { contact_user: { email: @contact_user.email, login: @contact_user.login, name: @contact_user.name } }
    end

    assert_redirected_to contact_user_url(ContactUser.last)
  end

  test "should show contact_user" do
    get contact_user_url(@contact_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_user_url(@contact_user)
    assert_response :success
  end

  test "should update contact_user" do
    patch contact_user_url(@contact_user), params: { contact_user: { email: @contact_user.email, login: @contact_user.login, name: @contact_user.name } }
    assert_redirected_to contact_user_url(@contact_user)
  end

  test "should destroy contact_user" do
    assert_difference('ContactUser.count', -1) do
      delete contact_user_url(@contact_user)
    end

    assert_redirected_to contact_users_url
  end
end
