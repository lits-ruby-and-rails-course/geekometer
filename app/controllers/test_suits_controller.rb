class TestSuitsController < ApplicationController
  before_action :authenticate_user!
  def index
    @test_suits = current_user.test_suits.completed
  end

  def new
    @test_suit = TestSuit.create(user: current_user)
    path = @test_suit.questions.empty? ? root_path : test_me_user_test_suit_path(current_user, @test_suit)
    flash = @test_suit.questions.empty? ? { error: "There are not enough questions" } : {}
    redirect_to path, flash: flash
  end

  def show
    @test_suit = TestSuit.find(params[:id])
    @user_answers = @test_suit.test_suit_answers.map &:answer_id
  end

  def complete
    if params[:test_suit_answers]
      test_suit = TestSuit.find(params[:test_suit_id])
      test_suit.build_test_suit_answers(params[:test_suit_answers])
      test_suit.complete!
      test_suit.save!
      redirect_to user_test_suit_path(test_suit.user, test_suit)
    else
      flash[:danger] = 'Answers should be present'
      redirect_to :back
    end
  end

  def test_me
    @test_suit = TestSuit.find(params[:id])
    render :template => 'test_suits/new'
  end
end
