require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should create session" do
    # Requires a valid user in fixtures/test setup
    post session_url, params: { email: "test@example.com", password: "password" }
    # assert_redirected_to or assert_response depending on your logic
  end

  test "should destroy session" do
    delete session_url
    assert_redirected_to new_session_url  # or wherever you redirect after logout
  end
end
