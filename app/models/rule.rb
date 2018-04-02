class Rule < ApplicationRecord

  has_one :badge

  def self.first_try?(current_user)
    current_user.test_passages.where(test_id: current_user.test_passages.last.test_id).size == 1
  end

  def self.all_backend?(current_user)
    backend_tests_ids = Test.by_category('Backend').ids.uniq
    user_tests_ids = current_user.test_passages.successful.pluck(:test_id).uniq
    (backend_tests_ids - user_tests_ids).empty?
  end

  def self.all_easy?(current_user)
    easy_tests_ids = Test.easy.ids.uniq
    user_tests_ids = current_user.test_passages.successful.pluck(:test_id).uniq
    (easy_tests_ids - user_tests_ids).empty?
  end

end
