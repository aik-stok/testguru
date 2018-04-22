class AssignmentsController < ApplicationController

  before_action :set_assignment, only: %i[show update result gist]
  before_action :set_badge_assignment, only: %i[result]

  def show
  end

  def result
    if @assignment.success?
      rules_array = @badge_assignment.check_all_rules(current_user, @assignment.test_id.to_i)
      current_user.badges.push(Badge.where(rule:[rules_array]))
    end
  end

  def gist
    result = GistQuestionService.new(@assignment.current_question).call
    flash_options = if result[:html_url].present?
      current_user.gists.create(question_id: @assignment.current_question.id, url: result[:id])
      {notice: "Success. URL: #{result[:html_url]}"}
    else
      {alert: "Fail."}
    end
    redirect_to @assignment, flash_options
  end

  def update
    @assignment.accept! params[:answer_ids]
    if @assignment.completed?
      @assignment.update(completed: true) if @assignment.success?
      redirect_to result_assignment_path(@assignment)
    else
      render 'show'
    end 
  end

  private 
  
  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def set_badge_assignment
   @badge_assignment = BadgeAssignment.new
  end
end