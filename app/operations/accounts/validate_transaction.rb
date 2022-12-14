module Accounts
    class ValidateTransaction
        def initialize(amount_in_cents:, from_account_id:, to_account_id:)
            @amount = amount_in_cents.try(:to_i)
            @from_account = Account.find(from_account_id.to_i)
            @to_account = Account.find(to_account_id.to_i)
            @errors = []
        end

        def execute!
            validate_own_account_transfer!
            validate_transfer!
            @errors
        end

        private

        def validate_transfer!
            if @from_account.balance_cents - @amount < 0.00
                @errors << "From account has not enough money!!!"
            end
        end

        def validate_own_account_transfer!
            if @from_account.id == @to_account.id
                @errors << "Not allowed to do own account transfer!!"
            end
        end
    end
end