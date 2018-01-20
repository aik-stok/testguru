class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show]

  def index
    @questions = @test.questions
  end

  def show
  end

  def new
    @question = @test.questions.new
  end
  
  def create
    @question =  @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
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
  
  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
