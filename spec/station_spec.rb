require 'station'

describe Station do
  subject { Station.new(double("name"),double("zone")) }
  it {is_expected.to respond_to(:name)}
  it {is_expected.to respond_to(:zone)}
end
