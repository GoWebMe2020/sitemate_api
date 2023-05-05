class IssuesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @issues = Issue.all
    respond_to do |format|
      format.html
      format.json { render json: @issues }
    end
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      render json: @issue, status: :created
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update(issue_params)
      render json: @issue, status: :ok
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy
    head :no_content
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end
end
