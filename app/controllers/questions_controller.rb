class QuestionsController < ApplicationController
  before_action :find_test, only: %i(index create new)

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  def index
    questions = @test.questions
    render plain: questions.inspect
  end

  def show
    question = Question.find(params[:id])
    render plain: question.inspect
  end

  def new

  end

  def create
    question = Question.create(question_params)

    render plain: question.inspect
  end

  def destroy
    Question.find(params[:id]).destroy
    render plain: 'Вопрос удален'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден!'
  end
end
