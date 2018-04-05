# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
  {
  "first_name" => "Max",
  "email" => "max@yahoo.com",
  "password" => "123456"
  },
  {
  "first_name" => "Alex",
  "email" => "alex@gmail.com",
  "password" => "123456"
  }
])

Admin.create([{
  "first_name" => "Alexandr",
  "admin" => true,
  "email" => "aikb2b@gmail.com",
  "password" => "123456"
  }])

Category.create(title: "Rails").tests.create([
{
  "title" => "Rails methods",
  "level" => 2,
  "user_id" => 3
  
  },
  {
  "title" => "Rails structure",
  "level" => 2,
  "user_id" => 3
  },
  {
  "title" => "Rails structure",
  "level" => 2,
  "user_id" => 3
  }
  ])

Category.create(title: "Ruby").tests.create([
{
  "title" => "String methods",
  "level" => 1,
  "user_id" => 3
  },
  {
  "title" => "Hash methods",
  "level" => 1,
  "user_id" => 3
  }
  ])

Test.find(1).questions.create(body: "How to return all instances of class?")
Test.find(2).questions.create(body: "What is Rails Active Record?")
Test.find(3).questions.create(body: "How to measure length of string?")
Test.find(4).questions.create(body: "How to return values key?")
Category.create(title: "SQL").tests.create(title: "Methods", level: 6, user_id: Admin.first.id).questions.create(body: "How to create database for psql?")

User.first.assignments.create(test_id: Test.first.id)

Question.first.answers.create(body: ".all method", correct: true)
Question.first.answers.create(body: ".find_by")

Question.second.answers.create(body: "ORM", correct: true)
Question.second.answers.create(body: "A wierd abbreviation",)
Question.second.answers.create(body: "Yeah...sure it's active.",)

Question.third.answers.create(body: "Use meter",)
Question.third.answers.create(body: ".length method", correct: true)
Question.third.answers.create(body: "On eye",)
