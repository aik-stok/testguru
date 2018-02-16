class TestsController < ApplicationController

  before_action :set_test, only: %i[show edit update destroy start ]
  before_action :find_questions, only: %i[show]
  def index
    @tests = Test.all
  end
  
  def show
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def new
    @test = Test.new
  end

  private
  
  def set_test
    @test = Test.find(params[:id])
  end
  
  def find_questions
    @questions = @test.questions
  end

end
