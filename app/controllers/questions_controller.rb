class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    @questions = @test.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new(test_id: params[:test_id])
    p @question.test_id
  end
  
  def create
    @question = Question.new(body: params[:question][:body], test_id: params[:test_id])
    if @question.save
      redirect_to @question
    else render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id]).destroy
    render plain: 'Deleted!'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_not_found
    render plain: 'Question not found!'
  end

end
