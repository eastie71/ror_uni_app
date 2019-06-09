# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Course.create(code: "CS101", name: "Introduction to Computer Science", description: "A comprehensive introduction into the topics of Computer Science. The course will cover all aspects of software development")
Course.create(code: "CS155", name: "Object Oriented Programming", description: "A solid introduction into the concepts of Object Oriented Programming. This is the most common method of software development and is a must for any modern programmer. Java programming language is used extensively in this course.")
Course.create(code: "CS211", name: "Operating Systems", description: "A study into the low level functionality of the operatiing system. Build you own operating system and understand basic principals behind memory allocation, user administration and more...")
Student.create(name: "Craig Eastwood", email: "craigdavideastwood@gmail.com", password: "password")
Student.create(name: "Arya Stark", email: "arya.stark@westofwesteros.com", password: "password")
