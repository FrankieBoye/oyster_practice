class Oystercard

Fare = 1
Minimum_balance = 1
Maximum_balance = 90

attr_reader :balance, :entry_station

def initialize
  @balance = 0
end

def top_up(amount)
  fail "Maximum balance of #{Maximum_balance} exceeded" if (@balance + amount) > Maximum_balance
  @balance += amount
end

def in_journey?
 @entry_station != nil
end

def touch_in(entry_station)
  @entry_station = entry_station
  fail "Insufficient balance to touch in" if @balance < Minimum_balance
end

def touch_out
  Fare
  @entry_station = nil
end

private
def fare(amount)
  @balance -= amount
end

end
