class AssignmentsController < ApplicationController

  before_action :set_assignment, only: %i[show update result gist]
  before_action :set_badge_assignment, only: %i[ update]

  def show
  end

  def result
    @badges = Badge.where(rule: params[:badges]) if @assignment.success?
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
       if @assignment.success?
         @assignment.update(completed: true)
         @rules_array = @badge_assignment.check_all_rules(current_user, @assignment.test_id.to_i)
         current_user.badges.push(Badge.where(rule:[@rules_array]))
       end
      redirect_to result_assignment_path(@assignment, badges: @rules_array)
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