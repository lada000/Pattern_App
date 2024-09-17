class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @balance = BalanceConverter.new(current_user.virtual_card.balance)
  end
end
