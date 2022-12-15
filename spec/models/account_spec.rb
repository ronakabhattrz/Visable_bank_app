# spec/models/account_spec.rb

require 'rails_helper'

RSpec.describe Account, :type => :model do
  subject {
    described_class.new(name: "John davis",
                        balance_cents: 18500)
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "should have many transactions" do
      t = Account.reflect_on_association(:transactions)
      expect(t.macro).to eq(:has_many)
    end
  end

  describe "Callbacks" do
    it { is_expected.to callback(:set_account_number).before(:create) }
  end

  describe "#balance" do
    it "balance should do something" do
      expect(subject.balance).to eq('$185.00')
    end
  end
end