class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy start update_inline]
  before_action :set_tests, only: %i[index update_inline]
  before_action :find_questions, only: %i[show]

  def index
  end
  
  def show
  end

  def create
    @test = current_user.created_tests.new(test_params)
    if @test.save
      redirect_to [:admin, @test]
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render 'new'
    end
  end
  
  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render 'index'
    end 
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
  
  def set_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :level)
  end

end
