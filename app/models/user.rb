class User < ApplicationRecord
  def user_tests(level)
    Test.joins('
      JOIN users_tests
      ON tests.id = users_tests.test_id')
      .where('users_tests.user_id = :user_id AND level = :level',
      user_id: self.id, level: level)
  end
end
