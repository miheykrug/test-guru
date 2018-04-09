class GivingBadgesService
  RULES = { all_backend?: 'Успешное прохождение всех тестов из категории Backend',
            first_try?: 'Успешное прохождение теста с первой попытки',
            all_easy?: 'Успешное прохождение всех тестов уровня easy' }.freeze

  IMAGES = %w[backend.png easy.png first.png]

  def self.check_badges(current_user)
    badges = []
    RULES.each_key do |rule|
      badge = Badge.find_by(rule: rule)
      if send(rule, current_user) && !current_user.badges.exists?(badge.id)
        badges << badge
      end
    end

    badges
  end

  private

  class << self
    def first_try?(current_user)
      current_user.test_passages.where(test_id: current_user.test_passages.last.test_id).size == 1
    end

    def all_backend?(current_user)
      backend_tests_ids = Test.by_category('Backend').ids.uniq
      user_tests_ids = current_user.test_passages.successful.pluck(:test_id).uniq
      (backend_tests_ids - user_tests_ids).empty?
    end

    def all_easy?(current_user)
      easy_tests_ids = Test.easy.ids.uniq
      user_tests_ids = current_user.test_passages.successful.pluck(:test_id).uniq
      (easy_tests_ids - user_tests_ids).empty?
    end
  end

end