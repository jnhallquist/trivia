require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { email: 'foo@invalid',
                                              password:              'foo',
                                              password_confirmation: 'bar' } }

    assert_template 'users/edit'
  end

  test 'successful edit with friendly forwarding' do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    email = 'foo@bar.com'
    patch user_path(@user), params: {
      user: { email: email,
              password:              'foobared',
              password_confirmation: 'foobared' }
    }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal email, @user.email
  end
end
