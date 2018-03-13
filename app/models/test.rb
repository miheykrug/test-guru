class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  message: 'has already been taken with same level'}

  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  scope :easy,   -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard,   -> { where('level > 4') }
  scope :by_category, -> (title) { joins(:category)
    .where(categories: { title: title })
    .order(title: :desc) }

  def self.category_tests_list(title)
    self.by_category(title).pluck(:title)
  end
end
