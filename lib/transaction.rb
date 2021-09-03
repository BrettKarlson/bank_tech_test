# frozen_string_literal: true

# This class provides credit and debit functionality
class Transaction
  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def credit(amount)
    @balance += amount.to_f
    @transactions.unshift({ date: Time.new.strftime('%d/%m/%Y'), transaction: :deposit, amount: format('%.2f', amount),
                            balance: format('%.2f', @balance) })
  end

  def debit(amount)
    raise 'Insufficient funds' if (@balance - amount).negative?

    @balance -= amount.to_f
    @transactions.unshift({ date: Time.new.strftime('%d/%m/%Y'), transaction: :withdraw, amount: format('%.2f', amount),
                            balance: format('%.2f', @balance) })
  end
end
