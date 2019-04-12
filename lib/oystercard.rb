class Oystercard

Fare = 1
Minimum_balance = 1
Maximum_balance = 90

attr_reader :balance, :entry_station, :exit_station, :trip, :trips

def initialize
  @balance = 0
  @entry_station = entry_station
  @exit_station = exit_station
  @trip = []
  @trips = []
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

def touch_out(exit_station)
  Fare
  @exit_station = exit_station
  @trip << {:entry_station=>@entry_station, :exit_station=>@exit_station}
  @trips << {:entry_station=>@entry_station, :exit_station=>@exit_station}
  @entry_station = nil

end

private
def fare(amount)
  @balance -= amount
end

end
