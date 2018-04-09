class Badge < ApplicationRecord

  IMAGES = %w[backend.png easy.png first.png].freeze

  has_many :user_badges
  has_many :users, through: :user_badges

end
