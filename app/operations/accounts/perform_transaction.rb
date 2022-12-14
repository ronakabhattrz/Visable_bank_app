module Accounts
    class PerformTransaction
        def initialize(amount_in_cents:, from_account_id:, to_account_id:)
            @amount = amount_in_cents.to_i
            @from_account = Account.find(from_account_id.to_i)
            @to_account = Account.find(to_account_id.to_i)
        end

        def execute!
            ActiveRecord::Base.transaction do
                @to_account.transactions.create!(
                    from_account: @from_account,
                    to_account: @to_account,
                    amount: @amount
                )
                # MINUS MONEY TO FROM_ACCOUNT
                @from_account.update!(balance_cents: @from_account.balance_cents - @amount)

                # ADD MONEY TO TO_ACCOUNT
                @to_account.update!(balance_cents: @to_account.balance_cents + @amount)
            end
            {
              from_account_balance: @from_account.balance,
              to_account_balance: @to_account.balance,
              messages: "Successfully transferred #{amount_in_dollar(@amount)} from account #{@from_account.account_number} To #{@to_account.account_number}"
            }
        end

        def amount_in_dollar(amount_in_cents)
            ActiveSupport::NumberHelper.number_to_currency(amount_in_cents.fdiv(100))
        end
    end
end