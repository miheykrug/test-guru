class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_passages
  has_many :users, through: :tests_passages
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.category_tests(category)
    Test.joins('
      JOIN categories
      ON category_id = categories.id')
      .where('categories.title = :category', category: category)
      .order(title: :desc).pluck(:title)
  end
end
