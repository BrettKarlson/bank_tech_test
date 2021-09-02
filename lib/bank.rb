# frozen_string_literal: true
require_relative 'transaction'
require_relative 'statement'
# This class tracks deposits and withdrawals
class Bank

  def initialize(transaction = Transaction.new, statement = Statement.new)
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount)
    @transaction.credit(amount)
  end

  def withdraw(amount)
    @transaction.debit(amount)
  end

  def statement
    list = @transaction.transactions
    @statement.print_statement(list)
  end
end