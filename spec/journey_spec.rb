require 'journey'

describe Journey do

  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it {is_expected.to respond_to(:journey_list)}

  it "can start a journey" do
      subject.start_journey(entry_station)
      expect(subject.journey_list[-1][:entry_station]).to eq entry_station
  end

  it "can end a journey" do
      subject.start_journey(entry_station)
      subject.end_journey(exit_station)
      expect(subject.journey_list[-1][:exit_station]).to eq exit_station
  end

  it "can confirm if in a journey" do
      subject.start_journey(entry_station)
      expect(subject).to be_travelling
  end

end
