require "test_helper"

class ConversionPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get personal" do
    get conversion_pages_personal_url
    assert_response :success
  end
end
