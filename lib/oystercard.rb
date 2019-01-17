class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journey_list

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station
    @journey_list = []
  end

  def topup(amount)
    fail "max amount reached" if @balance + amount > MAX_BALANCE
    add(amount)
  end

  def add(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -=amount
  end

  def travelling?
    !!entry_station
  end

  def touch_in(station)
    fail "balance too low" if @balance < MIN_BALANCE
    @journey_list << {:entry_station => station}
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    @journey_list[-1][:exit_station] = station
    @entry_station = nil
    @exit_station = station
  end


private :add, :deduct

end
