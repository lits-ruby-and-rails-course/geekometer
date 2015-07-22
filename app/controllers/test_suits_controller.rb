class TestSuitsController < ApplicationController
  before_action :authenticate_user!
  def index
    @test_suits = current_user.test_suits.completed
  end

  def new
    test_suit = TestSuit.create(user_id: current_user)
    redirect_to user_test_suit_path(current_user, test_suit)
  end

  def show
    @test_suit = TestSuit.find(params[:id])
  end

  def complete
    test_suit = TestSuit.find(params[:test_suit_id])
    # set test_suite_answers
    test_suit.complete!
    test_suit.save!
    redirect_to user_test_suit_path(current_user, test_suit)
    # @p = params
  end
end
