require 'test_helper'

  class UserTest < ActiveSupport::TestCase
    def setup
      @user = users(:one)
    end
  
    test "email should be present" do
      @user.email = nil
      assert_not @user.valid?, "User should be invalid without an email"
    end
end