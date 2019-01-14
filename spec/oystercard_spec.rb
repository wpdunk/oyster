require 'oystercard'

describe Oystercard do

  before(:each) do
    @amount = double("amount")
  end

  it "has a balance" do
    expect(subject).to respond_to(:balance)
  end

  it "has initial balance of 0" do
    expect(subject.balance).to eq(0)
  end

  it "can be topped up" do
    expect(subject.topup(10)).to eq(10)
  end

  it "can raise error max amount exceeded" do
    expect { subject.topup(100) }.to raise_error "max amount reached"
  end
end
