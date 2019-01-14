class Oystercard

  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
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

private :add

end
