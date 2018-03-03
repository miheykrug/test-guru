class User < ApplicationRecord
  has_many :tests_passages
  has_many :tests, through: :tests_passages
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  validates :name, :email, presence: true


  def user_tests(level)
    Test.joins('
      JOIN tests_passages
      ON tests.id = tests_passages.test_id')
      .where('tests_passages.user_id = :user_id AND level = :level',
      user_id: self.id, level: level)
  end
end
