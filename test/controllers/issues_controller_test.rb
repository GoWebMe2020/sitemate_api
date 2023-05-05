require "test_helper"

class IssuesControllerTest < ActionDispatch::IntegrationTest
  test "should return all issues" do
    get issues_url
    assert_response :success
    assert_equal(Issue.all.to_json, @response.body)
    Issue.delete_all
  end
end
