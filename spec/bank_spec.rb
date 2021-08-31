require 'bank'

RSpec.describe Bank do
  it 'shows the initial balance' do
    expect(subject.balance).to eq 0
  end
end