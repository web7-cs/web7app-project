require 'test_helper'

class SqlsolutionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sqlsolution_index_url
    assert_response :success
  end

end
