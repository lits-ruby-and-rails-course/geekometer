module PagesHelper
  def random_question
    Question.offset(rand(Question.count)).first
  end
end
