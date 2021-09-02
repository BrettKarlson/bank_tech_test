require_relative 'transaction'
# This class prints out a statement
class Statement

  def print_statement(list)
    puts 'date      || credit || debit || balance'
    i = 0
    while i < list.count
      puts "#{list[i][:date]} || #{credit?(i, list)} || #{debit?(i, list)} ||  #{list[i][:balance]} "
      i += 1
    end
  end
 
  def credit?(count, list)
    list[count][:transaction] == :deposit ? list[count][:amount] : '  '
  end

  def debit?(count, list)
    list[count][:transaction] == :withdraw ? list[count][:amount] : '  '
  end
end