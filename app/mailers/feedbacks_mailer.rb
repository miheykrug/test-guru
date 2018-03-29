class FeedbacksMailer < ApplicationMailer
  def feedback(feedback)
    @user = feedback.user
    @feedback = feedback

    mail to: Admin.first.email
  end
end
