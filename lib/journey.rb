class Journey

  attr_reader :journey_list

  def initialize
    @journey_list = []
  end

  def start_journey(station)
    @journey_list << {:entry_station => station}
  end

  def end_journey(station)
    if @journey_list[-1].include?(:exit_station) == true
      @journey_list << {:entry_station => "n/a", :exit_station => station}
    else
      @journey_list[-1][:exit_station] = station if journey_list.length > 0
    end
  end

  def travelling?
    if @journey_list.length == 0
      return false
    elsif @journey_list.length > 0
      return !(@journey_list[-1][:exit_station])
    else
      return false
    end
  end


end
