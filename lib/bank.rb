# frozen_string_literal: true

# This class tracks inputs and outputs
class Bank
  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << { deposit: amount }
  end

  def withdraw(amount)
    raise 'Insufficient funds' if (@balance - amount).negative?

    @balance -= amount
    @transactions << { withdrawal: amount }
  end

  def statement
    transactions
  end
end
