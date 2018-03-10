module QuestionsHelper
  def question_header(question)
    action = if question.new_record?
      'Создать'
    else
      'Изменить'
    end
    "#{action} вопрос для теста #{question.test.title}"
  end
end
