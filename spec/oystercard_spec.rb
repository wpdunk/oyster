require 'oystercard'
# require 'station'

describe Oystercard do

  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }


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

  describe "#journey?" do

    before(:each) do
      @card = Oystercard.new
      @card.topup(Oystercard::MIN_BALANCE)
      @card.touch_in(entry_station)
    end

    it 'is initially not in a journey' do
      expect(subject).not_to be_travelling
    end

    it "can touch in" do
      expect(@card).to be_travelling
    end

    it "can touch out" do
      @card.touch_out(exit_station)
      expect(@card).not_to be_travelling
    end

  end

  describe "#touch_in" do
    it "checks balance is above min amount" do
      expect { subject.touch_in(entry_station) }.to raise_error "balance too low"
    end

    it "stores the entry station in journey_list" do
      subject.topup(Oystercard::MIN_BALANCE)
      subject.touch_in(entry_station)
      # expect(subject.journey_list.fetch(:entries).pop).to eq (station)
      expect(subject.journey_list[-1][:entry_station]).to eq entry_station
    end
  end

  describe "#touch_out" do
    it "reduces balance by correct amount" do
        subject.topup(Oystercard::MIN_BALANCE)
        subject.touch_in(entry_station)
        expect {subject.touch_out(exit_station)}.to change{subject.balance}.by(-Oystercard::MIN_BALANCE)
    end

    it "forgets the last station" do
      subject.topup(Oystercard::MIN_BALANCE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq nil
    end

    it "takes an exit station" do
      expect(subject).to respond_to(:touch_out).with(1)
    end

    it 'stores exit station' do
      subject.topup(Oystercard::MIN_BALANCE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journey_list[-1][:exit_station]).to eq exit_station
    end
  end

  describe '::journey_list' do

    it 'has an empty list of journeys by default' do
      expect(subject.journey_list).to be_empty
    end

    it 'stores a journey' do
      subject.topup(Oystercard::MIN_BALANCE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journey_list).to include journey
    end

  end




end
