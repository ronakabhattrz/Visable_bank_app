class Transaction < ApplicationRecord
  # Associations
  belongs_to :account

  # Validations
  validates :account, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_number, uniqueness: true

  # CALLBACKS
  before_create :set_transaction_number

  def set_transaction_number
    self.transaction_number = generate_transaction_number
  end

  def generate_transaction_number
    loop do
      token = SecureRandom.hex(10)

      break token unless Transaction.where(transaction_number: token).exists?
    end
  end
end
