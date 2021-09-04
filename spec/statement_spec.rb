# frozen_string_literal: true

require 'statement'
require 'transaction'

RSpec.describe Statement do
  it 'prints the title of the statement' do
    transaction = Transaction.new
    list = transaction.credit(20)
    # statement = subject.print_statement(list)
    expect(list).to eq([{ amount: '20.00', balance: '20.00', date: Time.new.strftime('%d/%m/%Y'),
                          transaction: :deposit }])
  end

  describe '#print_statement method' do
    before do
      allow(subject.print_statement([])).to receive(:while).and_yield
      allow(subject).to receive(:credit?).and_return(true)
      allow(subject).to receive(:debit?) { true }
    end

    it 'tests the loop' do
      expect(subject).to receive(:credit?).once
      expect(subject).to receive(:debit?).once
      subject.credit?(0, [])
      subject.debit?(0,[])
    end
  end

end
