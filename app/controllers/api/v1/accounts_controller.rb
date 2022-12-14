class Api::V1::AccountsController < Api::V1::BaseController
  before_action :set_account, except: [:transfer]

  def show
    data = {id: @account.id, balance: @account.balance}
    render json: data, status: :ok
  end

  def index
    transactions = @account.transactions.limit(10)
    render json: transactions, status: :ok
  end

  def transfer
    from_account_id = params[:from_account_id]
    to_account_id   = params[:to_account_id]
    amount_in_cents = params[:amount_in_cents]

    if from_account_id.blank? || to_account_id.blank? || amount_in_cents.blank?
      return render json: { errors: "Missing inputs!" }, status: 402
    end

    errors = ::Accounts::ValidateTransaction.new(amount_in_cents: amount_in_cents, from_account_id: from_account_id, to_account_id: to_account_id).execute!
    if errors.size > 0
      render json: { errors: errors }, status: 402
    else
      response = ::Accounts::PerformTransaction.new(amount_in_cents: amount_in_cents, from_account_id: from_account_id, to_account_id: to_account_id).execute!
      render json: { response: response }
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end
end
