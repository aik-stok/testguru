class AssignmentsController < ApplicationController

  before_action :set_test_passage, only: %i[show update result]

  def show
    @question_number = @assignment.test.questions.index(@assignment.current_question) + 1
    @question_quantity = @assignment.test.questions.count
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