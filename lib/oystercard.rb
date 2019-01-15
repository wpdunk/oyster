class Oystercard

  attr_reader :balance

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @travelling = false

    # @journey = false
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
    @travelling
  end

  def touch_in
    fail "balance too low" if @balance < MIN_BALANCE
    @travelling = true
  end

  def touch_out
    @travelling = false
    deduct(MIN_BALANCE)
  end

  # def in_journey?
  #   @journey
  # end
  #
  # def touch_in
  #   @journey = true
  # end
  #
  # def touch_out
  #   @journey = false
  # end

private :add, :deduct

end
