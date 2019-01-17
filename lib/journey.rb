class Journey

  attr_reader :journey_list

  def initialize
    @journey_list = []
  end

  def start_journey(station)
    @journey_list << {:entry_station => station}
  end

  def end_journey(station)
    @journey_list[-1][:exit_station] = station
  end

  def travelling?
    return !(@journey_list[-1][:exit_station]) if @journey_list.length > 0
    return false
  end


end
