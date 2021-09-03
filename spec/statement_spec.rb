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
end
