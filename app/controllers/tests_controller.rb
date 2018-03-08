class TestsController < ApplicationController
  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
  end
end
