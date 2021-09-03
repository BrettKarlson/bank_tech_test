# frozen_string_literal: true

require 'bank'
require 'transaction'

RSpec.describe Bank do
  it 'shows the initial balance' do
    transaction = Transaction.new
    expect(transaction.balance).to eq 0
  end
  it 'raises an error if insufficient funds' do
    subject.deposit(20)
    expect { subject.withdraw(30) }.to raise_error 'Insufficient funds'
  end
end
