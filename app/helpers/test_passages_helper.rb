module TestPassagesHelper
  def result_class(test_passage)
    return 'success' if test_passage.test_success?
    'fail'
  end

  def result_string(test_passage)
    return 'Тест пройден' if test_passage.test_success?
    'Тест не пройден'
  end
end
