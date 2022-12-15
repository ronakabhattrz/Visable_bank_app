# spec/models/transaction_spec.rb

require 'rails_helper'

RSpec.describe Transaction, :type => :model do

  let(:from_account) { Account.create(name: "Ronak Bhatt", balance_cents: 20000, balance_currency: "USD") }
  let(:to_account) { Account.create(name: "Shivam Bhatt", balance_cents: 20000, balance_currency: "USD") }

  subject {
    described_class.new(from_account: from_account, to_account: to_account, amount: 1000)
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a amount" do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Callbacks" do
    it { is_expected.to callback(:set_transaction_number).before(:create) }
  end

end