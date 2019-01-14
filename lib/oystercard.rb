class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def topup(amount)
    fail "max amount reached" if @balance + amount > 90
    @balance += amount
    @balance
  end


end
