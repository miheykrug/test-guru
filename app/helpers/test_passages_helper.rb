module TestPassagesHelper
  def test_passage_success_percent(test_passage)
    (test_passage.correct_questions * 100) / test_passage.test.questions.count
  end
end
