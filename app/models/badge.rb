class Badge < ApplicationRecord

  RULES = { all_backend?: 'Успешное прохождение всех тестов из категории Backend',
            first_try?: 'Успешное прохождение теста с первой попытки',
            all_easy?: 'Успешное прохождение всех тестов уровня easy' }.freeze

  has_many :user_badges
  has_many :users, through: :user_badges

end
