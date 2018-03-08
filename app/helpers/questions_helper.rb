module QuestionsHelper
  def question_header
    if @question.new_record?
      str = 'Создать'
    else
      str = 'Изменить'
    end
    "#{str} вопрос для теста #{@test.title}"
  end
end
