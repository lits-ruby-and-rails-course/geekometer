class TestSuitsController < ApplicationController
  before_action :authenticate_user!
  def index
    @test_suits = current_user.test_suits.completed
  end

  def new
    test_suit = TestSuit.create(user_id: current_user)
    test_suit.set_questions!
    redirect_to user_test_suit_path(current_user, test_suit)
  end

  def show
    @test_suit = TestSuit.find(params[:id])
  end
end
