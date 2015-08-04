class TestSuitsController < ApplicationController
  before_action :authenticate_user!
  def index
    @test_suits = current_user.test_suits.completed
  end

  def new
    @test_suit = TestSuit.create(user: current_user)
    if @test_suit.questions.empty?
      redirect_to root_path, flash: { error: "There is not enaught questions" }
    end
  end

  def show
    @test_suit = TestSuit.find(params[:id])
  end

  def complete
    test_suit = TestSuit.find(params[:test_suit_id])
    test_suit.build_test_suit_answers(params[:test_suit_answers])
    test_suit.complete!
    test_suit.save!
    redirect_to user_test_suit_path(test_suit.user, test_suit)
  end
end
