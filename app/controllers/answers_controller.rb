class AnswersController < ApplicationController
  before_action :set_answer, only: %i[show edit update destroy]
  before_action :find_question, only: %i[create new]

  def show
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
