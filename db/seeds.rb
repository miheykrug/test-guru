# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create([
  { title: 'Frontend' },
  { title: 'Backend'},
  { title: 'Other' }])

Test.create([
  { title: 'HTML', category_id: 1 },
  { title: 'CSS',  category_id: 1 },
  { title: 'Ruby', level: 2, category_id: 2 },
  { title: 'Go',   level: 3, category_id: 2 },
  { title: 'SQL',  level: 1, category_id: 3 }])

Question.create([
  { body: 'Что такое Ruby?',                          test_id: 3 },
  { body: 'Назовите тип языка Go',                    test_id: 4 },
  { body: 'Что обозначает тег div?',                  test_id: 1 },
  { body: 'Какая разница между сторами и символами?', test_id: 3 },
  { body: 'Как расшифровывается аббревиатура SQL?',   test_id: 5 }])

Answer.create([
  { body: 'это драгоценный камень',           correct: false, question_id: 1 },
  { body: 'компилируемый',                    correct: true,  question_id: 2 },
  { body: 'это блочный элемент',              correct: true,  question_id: 3 },
  { body: 'разницы нет',                      correct: false, question_id: 4 },
  { body: 'язык структурированных запросов',  correct: false, question_id: 5 }])

User.create([
  { name: 'Миша', email: 'miheykrug@mail.ru'},
  { name: 'Саша', email: 'sasha2013@gmail.com'}])

connection = ActiveRecord::Base.connection()
connection.execute('
INSERT INTO users_tests(user_id, test_id) VALUES
(1, 1), (1, 3), (1, 4), (1, 5),
(2, 1), (2, 2), (2, 3), (2, 5);')