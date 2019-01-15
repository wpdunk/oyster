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

  describe "#topup" do
    it "can be topped up" do
      expect(subject.topup(10)).to eq(10)
    end

    it "can raise error max amount exceeded" do
      max_topup = Oystercard::MAX_BALANCE
      subject.topup(max_topup)
      expect { subject.topup 1 }.to raise_error "max amount reached"
    end
  end

  describe "#deduct" do
  it "can be deducted" do
    subject.topup(10)
    expect(subject.deduct(2)).to eq(8)
    end
  end

  describe "#journey?" do

    it 'is initially not in a journey' do
      expect(subject).not_to be_travelling
    end

    it "can touch in" do
      subject.topup(Oystercard::MIN_BALANCE)
      subject.touch_in
      expect(subject).to be_travelling
    end

    it "can touch out" do
      subject.topup(Oystercard::MIN_BALANCE)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_travelling
    end

  end

  describe "#touch_in" do
    it "checks balance is above min amount" do
      expect { subject.touch_in }.to raise_error "balance too low"
    end
  end




end
