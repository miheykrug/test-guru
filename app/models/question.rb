class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_answers_quantity

  def validate_answers_quantity
    error_string = 'should have from 1 to 4 answers'
    errors.add(:question, error_string) if answers.length.between?(1, 4)
  end
end
