module PagesHelper
  def random_question
    Question.offset(rand(Question.count)).first
  end

  def random_technology_logo
    random_record = Technology.offset(rand(Technology.count)).first
    Technology.all.empty? ? 'ruby.jpg' : random_record.logo
  end
end
