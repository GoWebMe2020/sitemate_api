class IssuesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @issues = Issue.all
    render json: @issues
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      render json: @issue, status: :created
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end
end
