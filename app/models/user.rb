class User < ApplicationRecord
  has_many :tests_passages
  has_many :tests, through: :tests_passages
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  validates :name, :email, presence: true


  def user_tests(level)
    tests.where('level = :level', level: level)
  end
end
