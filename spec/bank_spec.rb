# frozen_string_literal: true

require 'bank'

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
RSpec.describe Bank do
  let(:statement) { double("statement", print_statement: 'date, credit, debit, balance', credit?: true, debit?: false, transactions: :transactions) }
  subject { described_class.new(statement) }
  
  describe '#print_statement method' do
    it 'prints a string of transactions' do
      allow(Statement).to receive(:new) { statement }
      expect(statement).to receive(:print_statement)
      # expect(statement).to receive(:credit?)
      # expect(statement).to receive(:debit?)
      subject.statement
    end
  end
end
