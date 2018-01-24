class TestsController < ApplicationController
  before_action :find_test, only: %i[show create]
  before_action :find_questions, only: %i[show]

  def index
    @tests = Test.all
  end
  
  def show
  end

  private
  
  def find_test
    @test = Test.find(params[:id])
  end
  
  def find_questions
    @questions = @test.questions
  end
end
