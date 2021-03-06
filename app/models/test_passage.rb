class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  scope :successful, -> { where('result >= 85') }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.result = self.result_to_percent
    save!
  end

  def completed?
    current_question.nil?
  end

  def completed
    self.current_question = nil
  end

  def time_left
    test_end - Time.current
  end

  def test_end
    created_at + test.timer * 60
  end

  def result_to_percent
    (correct_questions * 100) / test.questions.size
  end

  def test_success?
    result_to_percent >= 85
  end

  private

  def before_validation_set_current_question
    if new_record?
      self.current_question = test.questions.first
    else
      self.current_question = test.questions.order(:id).find_by('id > ?', current_question.id)
    end

    self.current_question_number += 1
  end

  def correct_answer?(answer_ids)
    answer_ids ||= []
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
