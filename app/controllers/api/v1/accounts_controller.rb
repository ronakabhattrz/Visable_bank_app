class Api::V1::AccountsController < Api::V1::BaseController
  before_action :set_account

  def show
    data = {id: @account.id, balance: @account.balance}
    render json: data, status: :ok
  end

  def index
    transactions = @account.transactions.limit(10)
    render json: transactions, status: :ok
  end

  def transter
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end
end
