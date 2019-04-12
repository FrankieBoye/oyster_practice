require 'oystercard'

describe Oystercard do

it 'must store a balance' do
  expect(subject.balance).to eq (0)
end

it 'should start not in journey' do
  expect(subject).not_to be_in_journey
end

it 'can touch in' do
  subject.top_up(5)
  subject.touch_in("Aldgate")
  expect(subject).to be_in_journey
end

it 'can touch out' do
  subject.top_up(5)
  subject.touch_in("Aldgate")
  subject.touch_out
  expect(subject).not_to be_in_journey
end

it 'can save the entry station' do
  subject.top_up(5)
  subject.touch_in("Aldgate")
  expect(subject.entry_station).to eq "Aldgate"
end

# it 'must deduct the fare when touched out' do
#   subject.top_up(5)
#   subject.touch_in
#   subject.touch_out
#   expect(subject.balance).to eq (4)
# end


it 'raises an error if the mimimum balance is not met' do
  expect{ subject.touch_in("Aldgate") }.to raise_error "Insufficient balance to touch in"
end

# it 'must deduct the fare' do
#   expect{ subject.fare 1 }.to change { subject.balance }.by -1
# end

describe '#top_up' do
  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can add money to the balance' do
    expect{ subject.top_up 1 }.to change { subject.balance }.by 1
  end

  end
end
