require 'transaction'

RSpec.describe Transaction do
  it 'registers a deposit' do
    subject.credit(20)
    expect(subject.balance).to eq 20
  end

  it 'registers a withdrawal' do
    subject.credit(100)
    subject.debit(50)
    expect(subject.balance).to eq 50
  end

  it 'saves a transaction to state' do
    subject.credit(100)
    expect(subject.transactions).to eq [{ date: Time.new.strftime('%d/%m/%Y'),
                                          transaction: :deposit,
                                          amount: '100.00',
                                          balance: '100.00' }]
  end
end