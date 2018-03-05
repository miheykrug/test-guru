class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_quantity, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_answers_quantity
    error_string = 'should have no more than 4 answers'
    errors.add(:question, error_string) if question.answers.size >= 4
  end
end
