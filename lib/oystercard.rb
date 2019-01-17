class Oystercard

  attr_reader :balance, :journey

  PENALTY_CHARGE = 6
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journey = Journey.new
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

  def touch_in(station)
    fail "balance too low" if @balance < MIN_BALANCE
    deduct(PENALTY_CHARGE) if @journey.travelling?
    @journey.start_journey(station)
  end

  def touch_out(station)
     if @journey.travelling? == false
       deduct(PENALTY_CHARGE)
     else
       @journey.end_journey(station)
       deduct(MIN_BALANCE)
     end

   end


private :add, :deduct

end
