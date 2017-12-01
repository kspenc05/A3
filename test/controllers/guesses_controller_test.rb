require 'test_helper'

class GuessesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get guesses_new_url
    assert_response :success
  end

end
