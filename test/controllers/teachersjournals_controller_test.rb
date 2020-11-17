require 'test_helper'

class TeachersjournalsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get teachersjournals_home_url
    assert_response :success
  end

end
