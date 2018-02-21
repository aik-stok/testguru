class AssignmentsController < ApplicationController

  before_action :set_test_passage, only: %i[show update result]

  def show
  end

  def result
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