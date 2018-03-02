class Test < ApplicationRecord
  def self.category_tests(category)
    Test.joins('
      JOIN categories
      ON category_id = categories.id')
      .where('categories.title = :category', category: category)
      .order(title: :desc).pluck(:title)
  end
end
