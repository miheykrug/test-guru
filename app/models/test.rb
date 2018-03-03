class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_passages
  has_many :users, through: :tests_passages
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  message: 'has already been taken with same level'}

  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  scope :easy,   -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard,   -> { where('level > 4') }
  scope :category_tests_list, -> (category) { joins('JOIN categories
    ON category_id = categories.id')
    .where('categories.title = :category', category: category)
    .order(title: :desc).pluck(:title) }
end
