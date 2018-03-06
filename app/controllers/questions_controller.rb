class QuestionsController < ApplicationController
  before_action :find_test, only: %i(index create new)
  before_action :find_question, only: %i(show destroy)

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = @test.questions
    render plain: questions.inspect
  end

  def show
    render plain: @question.inspect
  end

  def new
  end

  def create
    question = @test.questions.build(question_params)
    question.save

    # render plain: question.inspect
    redirect_to test_questions_url
  end

  def destroy
    @question.destroy
    redirect_to test_questions_url
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

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден!'
  end
end
