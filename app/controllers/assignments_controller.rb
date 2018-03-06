class AssignmentsController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist ]

  def show
  end

  def result
  end

  def gist
    result = GistQuestionService.new(@assignment.current_question).call
    flash_options = if result[:html_url].present?
      current_user.gists.create(question_id: @assignment.current_question.id, url: result[:html_url])
      {notice: "Success. URL: #{result[:html_url]}"}
    else
      {alert: "Fail."}
    end
    redirect_to @assignment, flash_options
  end

  def update
    @assignment.accept! params[:answer_ids]
    if @assignment.completed?
      redirect_to result_assignment_path(@assignment)
    else
      render 'show'
    end 
  end

  private 
  
  def set_test_passage
    @assignment = Assignment.find(params[:id])
  end

end