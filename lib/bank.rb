# frozen_string_literal: true

# This class tracks inputs and outputs
class Bank
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise "Insufficient funds" if (@balance - amount) < 0
    @balance -= amount
  end
end
