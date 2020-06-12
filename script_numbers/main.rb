require_relative './magic_numbers'

class Main
  def initialize
    begin_script
  end

  def begin_script
    print_welcome
    @number_to_verify = gets.chomp.to_i
    validate_number
    @magic_number = MagicNumbers.new(@number_to_verify)
    print_result
  end

  def print_welcome
    puts 'Write a integer number to verify if is prime, esoteric or cetic number:'
  end

  def validate_number
    if @number_to_verify.zero?
      puts 'A problem was caught on your input! Did you put a zero or a string? '
      abort
    end
  end

  def print_result
    puts "The number is#{ @magic_number.prime? ? '' : 'n\'t' } a prime number"
    puts "The number is#{ @magic_number.esoteric? ? '' : 'n\'t' } a esoteric number"
    puts "The number is#{ @magic_number.cetic? ? '' : 'n\'t' } a cetic number"
  end
end

Main.new
