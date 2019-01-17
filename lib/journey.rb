class Journey

  attr_reader :journey_list

  def initialize
    @journey_list = []
  end

  def start_journey(station)
    @journey_list << {:entry_station => station}
  end

  def end_journey(station)
    @journey_list[-1][:exit_station] = station if journey_list.length > 0
  #TO CHANGE! IF DOUBLE TAPS OUT, SETS LAST EXIT STATION TO THIS ONE
  #JUST CHECK IF IT ALREADY EXISTS BEFORE SETTING, otherwise set a new
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
