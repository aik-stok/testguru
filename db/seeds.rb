# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
  {
  "name" => "Max",
  "admin" => false
  },
  {
  "name" => "Alex",
  "admin" => false
  },
  {
  "name" => "Lisa",
  "admin" => true
  },
])

Category.create([
  {
   "title" => "Ruby"
  },
  {
   "title" => "Rails"
  },
  {
   "title" => "SQL"
  }
])

Test.create([
  {
  "title" => "String methods",
  "level" => 1
  },
  {
  "title" => "Hash methods",
  "level" => 1
  },
  {
  "title" => "Commands",
  "level" => 1
  },
  {
  "title" => "Rails methods",
  "level" => 2
  },
  {
  "title" => "Rails structure",
  "level" => 2
  }
])

Question.create([
  {
  "body" => "How to measure length of string?"
  },
  {
  "body" => "How to capitalize length of string?"
  },
  {
  "body" => "How to return values key?"
  },
  {
  "body" => "How to create database from psql?"
  },
  {
  "body" => "How to return all instances of class?"
  }
])

