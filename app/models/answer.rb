class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :true_answers, -> { where(correct: true) }
end
