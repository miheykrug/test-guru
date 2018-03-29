class FeedbacksController < ApplicationController

  def new
    @feedback = current_user.feedbacks.build
  end

  def create
    @feedback = current_user.feedbacks.build(feedback_params)
    if @feedback.save
      FeedbacksMailer.feedback(@feedback).deliver_now
      redirect_to tests_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end

end
