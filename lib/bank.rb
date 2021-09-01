# frozen_string_literal: true

# This class tracks deposits and withdrawals
class Bank
  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount.to_f
    @transactions.unshift({ date: Time.new.strftime('%d/%m/%Y'), transaction: :deposit, amount: '%.2f' % amount, balance: '%.2f' % @balance })
  end

  def withdraw(amount)
    raise 'Insufficient funds' if (@balance - amount).negative?
    @balance -= amount.to_f
    @transactions.unshift({ date: Time.new.strftime('%d/%m/%Y'), transaction: :withdraw, amount: '%.2f' % amount, balance: '%.2f' % @balance })
  end

  def statement
    puts "date    || credit || debit || balance"
    i = 0
    while i < transactions.count do
      puts "#{transactions[i][:date]} || #{credit?(i)} || #{debit?(i)} ||  #{transactions[i][:balance]} "
      i += 1
    end
  end

  def credit?(count)
    transactions[count][:transaction] == :deposit ? transactions[count][:amount] : ""
  end

  def debit?(count)
    transactions[count][:transaction] == :withdraw ? transactions[count][:amount] : ""
  end
end
