class GivingBadgesService
  RULES = { all_backend?: 'Успешное прохождение всех тестов из категории Backend',
            first_try?: 'Успешное прохождение теста с первой попытки',
            all_easy?: 'Успешное прохождение всех тестов уровня easy' }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def check_badges
    Badge.all.select { |badge| !@user.badges.exists?(badge.id) && send(badge.rule.to_sym) }
  end

  private

  def first_try?
    @test_passage.test_success? && @user.test_passages.where(test_id: @test_passage.test_id).size == 1
  end

  def all_backend?
    backend_tests_ids = Test.by_category('Backend').ids.uniq
    user_tests_ids = @user.test_passages.successful.pluck(:test_id).uniq
    (backend_tests_ids - user_tests_ids).empty?
  end

  def all_easy?
    easy_tests_ids = Test.easy.ids.uniq
    user_tests_ids = @user.test_passages.successful.pluck(:test_id).uniq
    (easy_tests_ids - user_tests_ids).empty?
  end

end