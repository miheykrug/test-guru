module TestPassagesHelper
  def result_class(test_passage)
    test_passage.test_success? ? 'success': 'fail'
  end

  def result_string(test_passage)
    test_passage.test_success? ? 'Тест пройден' : 'Тест не пройден'
  end
end
