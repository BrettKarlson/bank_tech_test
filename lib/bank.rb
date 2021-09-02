# frozen_string_literal: true
require_relative 'transaction'
require_relative 'statement'
# This class tracks deposits and withdrawals
class Bank

  def initialize(transaction = Transaction.new)
    @transaction = transaction
    @balance = transaction.balance
    @list = @transaction.transactions
  end

  def deposit(amount)
    @transaction.credit(amount)
  end

  def withdraw(amount)
    @transaction.debit(amount)
  end

  def statement
    puts 'date    || credit || debit || balance'
    i = 0
    while i < @list.count
      puts "#{@list[i][:date]} || #{credit?(i)} || #{debit?(i)} ||  #{@list[i][:balance]} "
      i += 1
    end
  end
 
  def credit?(count)
    @list[count][:transaction] == :deposit ? @list[count][:amount] : ''
  end

  def debit?(count)
    @list[count][:transaction] == :withdraw ? @list[count][:amount] : ''
  end
end
