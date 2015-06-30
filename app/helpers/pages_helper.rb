module PagesHelper
  def random_question
    Question.offset(rand(Question.count)).first
  end

  def random_technology
    Technology.offset(rand(Technology.count)).first
  end
end
