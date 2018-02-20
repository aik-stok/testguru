class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show edit update destroy]

  def show
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end
  
  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
