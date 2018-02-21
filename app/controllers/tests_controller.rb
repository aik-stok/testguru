class TestsController < ApplicationController

  before_action :set_test, only: %i[start]
  before_action :find_questions, only: %i[show]

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private
  
  def set_test
    @test = Test.find(params[:id])
  end
  
  def find_questions
    @questions = @test.questions
  end

end
