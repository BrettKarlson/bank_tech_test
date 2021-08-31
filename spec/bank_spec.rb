# frozen_string_literal: true

require 'bank'

RSpec.describe Bank do
  it 'shows the initial balance' do
    expect(subject.balance).to eq 0
  end
  it 'registers a deposit' do
    subject.deposit(20)
    expect(subject.balance).to eq 20
  end
end
