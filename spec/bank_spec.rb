# frozen_string_literal: true

require 'bank'
require 'transaction'

RSpec.describe Bank do
  it 'shows the initial balance' do
    transaction = Transaction.new
    expect(transaction.balance).to eq 0
  end
  it 'registers a deposit' do   
    subject.deposit(20)
    # transaction = Transaction.new
    expect(subject.balance).to eq 20
  end
  it 'registers a withdrawal' do
    transaction = Transaction.new.
    subject.deposit(100)
    subject.withdraw(50)
    expect(transaction.balance).to eq 50
  end
  it 'raises an error if insufficient funds' do
    subject.deposit(20)
    expect { subject.withdraw(30) }.to raise_error 'Insufficient funds'
  end
  it 'saves a transaction to state' do
    subject.deposit(100)
    expect(subject.transactions).to eq [{ date: Time.new.strftime('%d/%m/%Y'),
                                          transaction: :deposit,
                                          amount: '100.00',
                                          balance: '100.00' }]
  end
end
