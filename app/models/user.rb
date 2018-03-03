class User < ApplicationRecord
  has_many :tests_passages
  has_many :tests, through: :tests_passages
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  def user_tests(level)
    Test.joins('
      JOIN users_tests
      ON tests.id = users_tests.test_id')
      .where('users_tests.user_id = :user_id AND level = :level',
      user_id: self.id, level: level)
  end
end
