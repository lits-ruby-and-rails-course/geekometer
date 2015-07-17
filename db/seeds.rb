# Create site users:
User.create(email: 'admin@user.com', password: '12345678', admin: true)
User.create(email: 'simple@user.com', password: '12345678', admin: false)

# Creating topics:
topic_stack = %w(Ruby SQL Javascript CSS HTML)
topic_stack.each do |topic|
  Topic.create!(name: topic, description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit!')
end

# Creating questions:
question_stack = [
    "Do fish get thirsty?",
    "Do vampires get AIDS?",
    "Who killed the Dead Sea?",
    "How many weeks are there in a light year?",
    "How do you know when you've run out of invisible ink?",
    "If your car says Dodge on the front of it, do you really need a horn?",
    "If you're a kleptomaniac, is there something you can take for it?",
    "If you try to fail, and succeed, which have you done?",
    "If you tell a joke in the forest, but nobody laughs, was it a joke?",
    "If you throw a cat out a car window, does it become kitty litter?",
    "Why is it called lipstick if you can still move your lips?",
    "Why is it that when you're driving and looking for an address, you turn down the volume on the radio?",
    "Why is it you must wait until night to call it a day?",
    "Why is lemon juice made with artificial flavor, and dishwashing liquid made with real lemonsWhy is the alphabet in that order?",
    "Is it because of that song?",
    "Why is the man who invests all your money called a broker?",
    "If you're in a vehicle going the speed of light, what happens when you turn on the headlights?",
    "In court, why do they ask if you swear to tell the truth?",
    "If you're planning on lying, do they really think you'll tell them so?",
    "Instead of wasting time hunting and cooking, why don't hunters just use flame-throwers?",
    "If your car says Dodge on the front of it, do you really need a horn?"
]

question_stack.each do |question|
  Question.create!(condition: question, difficulty: rand(1..7), topic_id: rand(1..5))
end

# Creating answers for questions:
answer_stack = %w(Yes No Maybe I\ don't\ know)

Question.all.each do |q|
  answer_stack.each do |a|
    answer = Answer.create!(solution: a)
    q.answers << answer
  end
  q.save!
  rand_answer = q.answers.sample
  rand_answer.answer_valid = true
  rand_answer.save!
end

# Creating technologies:
Technology.create!(name: 'Ruby', logo: 'rails.jpg')
Technology.create!(name: 'SQL', logo: 'sql.png')
Technology.create!(name: 'CSS', logo: 'css.png')

# Creating quiz questions:
QuestionQuiz.create!(condition: "Quiz Question One?")
QuestionQuiz.create!(condition: "Quiz Question Two?")
QuestionQuiz.create!(condition: "Quiz Question Three?")
QuestionQuiz.create!(condition: "Quiz Question Four?")

# Creating answers for quiz questions:
QuestionQuiz.all.each do |quiz|
  answer_stack.each do |a|
    answer = Answer.create!(solution: a)
    quiz.answers << answer
  end
  quiz.save!
  rand_answer = quiz.answers.sample
  rand_answer.answer_valid = true
  rand_answer.save!
end