# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Category.create([
  { title: 'Frontend' },
  { title: 'Backend'},
  { title: 'Other' }])

tests = Test.create([
  { title: 'HTML', level: 1, category_id: categories[0].id, author_id: User.first.id },
  { title: 'CSS',  level: 1, category_id: categories[0].id, author_id: User.first.id },
  { title: 'Ruby', level: 2, category_id: categories[1].id, author_id: User.first.id },
  { title: 'Go',   level: 3, category_id: categories[1].id, author_id: User.first.id },
  { title: 'SQL',  level: 1, category_id: categories[2].id, author_id: User.first.id }])

questions = Question.create([
  { body: 'Что такое Ruby?',                          test_id: tests[2].id },
  { body: 'Назовите тип языка Go',                    test_id: tests[3].id },
  { body: 'Что обозначает тег div?',                  test_id: tests[0].id },
  { body: 'Какая разница между сторами и символами?', test_id: tests[2].id },
  { body: 'Как расшифровывается аббревиатура SQL?',   test_id: tests[4].id }])

Answer.create([
  { body: 'это драгоценный камень',
    correct: false, question_id: questions[0].id },
  { body: 'компилируемый',
    correct: true,  question_id: questions[1].id },
  { body: 'это блочный элемент',
    correct: true,  question_id: questions[2].id },
  { body: 'разницы нет',
    correct: false, question_id: questions[3].id },
  { body: 'язык структурированных запросов',
    correct: false, question_id: questions[4].id }])

# TestPassage.create([
#   { user_id: users[0].id, test_id: tests[0].id },
#   { user_id: users[0].id, test_id: tests[2].id },
#   { user_id: users[0].id, test_id: tests[3].id },
#   { user_id: users[0].id, test_id: tests[4].id },
#   { user_id: users[1].id, test_id: tests[0].id },
#   { user_id: users[1].id, test_id: tests[1].id },
#   { user_id: users[1].id, test_id: tests[2].id },
#   { user_id: users[1].id, test_id: tests[4].id }])