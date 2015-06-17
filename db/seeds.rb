# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create site users:
User.create(email: 'admin@user.com', password: '12345678', admin: true)
User.create(email: 'simple@user.com', password: '12345678', admin: false)

# Creating dummy topics:
Topic.create(name: 'football', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam dolores distinctio, nostrum quam tempore libero quidem commodi laudantium delectus ipsa, quis exercitationem molestias, atque ad nam optio qui cupiditate rem!')
Topic.create(name: 'Politics', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam dolores distinctio, nostrum quam tempore libero quidem commodi laudantium delectus ipsa, quis exercitationem molestias!')
Topic.create(name: 'programming languages', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam dolores distinctio, nostrum quam tempore!')
Topic.create(name: 'Sports', description: 'Veniam dolores distinctio, nostrum quam tempore!')
Topic.create(name: 'film industry', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit!')

# Creating dummy questions:
Question.create(condition: 'Do fish get thirsty?', difficulty: '7', topic_id: '1')
Question.create(condition: 'Do vampires get AIDS?', difficulty: '4', topic_id: '1')
Question.create(condition: 'Where is Old Zealand?', difficulty: '1', topic_id: '1')
Question.create(condition: 'Who killed the Dead Sea?', difficulty: '7', topic_id: '2')
Question.create(condition: 'How many weeks are there in a light year?', difficulty: '4', topic_id: '2')
Question.create(condition: 'How do you know when you\'ve run out of invisible ink?', difficulty: '1', topic_id: '5')

# Creating dummy answers:

# For question #1:
Answer.create(question_id: '1', solution: 'Yes', answer_valid: false)
Answer.create(question_id: '1', solution: 'No', answer_valid: false)
Answer.create(question_id: '1', solution: 'I don\'t know', answer_valid: true)

# For question #2:
Answer.create(question_id: '2', solution: 'Ten', answer_valid: true)
Answer.create(question_id: '2', solution: 'Twenty', answer_valid: false)
Answer.create(question_id: '2', solution: 'I don\'t know', answer_valid: false)

# For other questions:
Answer.create(question_id: '3', solution: 'OK')
Answer.create(question_id: '4', solution: 'YES')
Answer.create(question_id: '5', solution: 'Alright!')