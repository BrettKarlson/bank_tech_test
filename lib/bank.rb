# frozen_string_literal: true

# This class tracks deposits and withdrawals
class Bank
  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << { Time.new.strftime('%d/%m/%Y') => { deposit: amount } }
  end

  def withdraw(amount)
    raise 'Insufficient funds' if (@balance - amount).negative?
    @balance -= amount
    @transactions << { Time.new.strftime('%d/%m/%Y') => { withdrawal: amount } }
  end

  def statement
    puts "date    || credit  || debit  || balance"
    transactions
  end
end
