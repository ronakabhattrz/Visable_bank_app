class Account < ApplicationRecord

  # VALIDATIONS
  validates :name, :account_type, presence: true
  validates :account_number, uniqueness: true

  # ENUM DATA TYPE
  enum account_type: %i(saving, checking)

  # Associations
  has_many :transactions, foreign_key: 'to_account_id', class_name: 'Transaction'

  # CALLBACKS
  before_create :set_account_number

  def set_account_number
    self.account_number = generate_account_number
  end

  def generate_account_number
    loop do
      token = SecureRandom.hex(10)

      break token unless Account.where(account_number: token).exists?
    end
  end

  def balance
    ActiveSupport::NumberHelper.number_to_currency(balance_cents.fdiv(100))
  end
end
