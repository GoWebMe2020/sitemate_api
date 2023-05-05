require "test_helper"

class IssuesControllerTest < ActionDispatch::IntegrationTest
  test "should return all issues" do
    get issues_url
    assert_response :success
    assert_equal(Issue.all.to_json, @response.body)
    Issue.delete_all
  end

  test "should create an issue" do
    post issues_url, params: { issue: { title: "Test Issue Title", description: "Test Title Description" } }
    assert_response :success
    assert_equal(Issue.last.to_json, @response.body)
    Issue.delete_all
  end

  test "should not create an issue without a description" do
    post issues_url, params: { issue: { title: "Test Issue Title" } }
    assert_response :unprocessable_entity
    assert_equal({ description: ["can't be blank"] }.to_json, @response.body)
    Issue.delete_all
  end

  test "should not create an issue without a title" do
    post issues_url, params: { issue: { description: "Test Issue Title" } }
    assert_response :unprocessable_entity
    assert_equal({ title: ["can't be blank"] }.to_json, @response.body)
    Issue.delete_all
  end
end
