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

  test "should update an issue" do
    issue = Issue.create(title: "Test Issue Title", description: "Test Issue Description")
    put issue_url(issue), params: { issue: { title: "Test Issue Title Updated", description: "Test Issue Description Updated" } }
    assert_response :success
    result = JSON.parse(@response.body)
    expected_response = {
      id: issue.id,
      title: "Test Issue Title Updated",
      description: "Test Issue Description Updated",
      created_at: result["created_at"],
      updated_at: result["updated_at"]
    }
    assert_equal(Issue.last.to_json, expected_response.to_json)
    Issue.delete_all
  end

  test "should update the title of an issue" do
    issue = Issue.create(title: "Test Issue Title", description: "Test Issue Description")
    put issue_url(issue), params: { issue: { title: "Test Issue Title Updated", description: "Test Issue Description" } }
    assert_response :success
    result = JSON.parse(@response.body)
    expected_response = {
      id: issue.id,
      title: "Test Issue Title Updated",
      description: "Test Issue Description",
      created_at: result["created_at"],
      updated_at: result["updated_at"]
    }
    assert_equal(Issue.last.to_json, expected_response.to_json)
    Issue.delete_all
  end
end
