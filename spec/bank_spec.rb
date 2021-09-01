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
  it 'registers a withdrawal' do
    subject.deposit(100)
    subject.withdraw(50)
    expect(subject.balance).to eq 50
  end
  it 'raises an error if insufficient funds' do
    subject.deposit(20)
    expect { subject.withdraw(30) }.to raise_error 'Insufficient funds'
  end
  it 'saves a transaction to state' do
    subject.deposit(100)
    subject.withdraw(50)
    expect(subject.statement).to eq [{ deposit: 100 }, { withdrawal: 50 }]
  end
end
