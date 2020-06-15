require_relative './sort_person'
require_relative 'month_days'

class Main
  attr_accessor :year, :month, :day
  attr_reader :sort_person
  include Calendar

  def initialize(sort_person = SortPerson)
    print_instructions
    @sort_person ||= sort_person.new([year, month, day])
    print_result
  end

  private
  def print_instructions
    get_year
    get_month
    get_day
  end

  def get_year
    loop do
      print 'Put the year of birthday with 4 digits: '
      @year = gets.chomp.to_i
      break if valid_year?
    end
  end

  def get_month
    loop do
      print 'Put the month of birthday: '
      @month = gets.chomp.to_i
      break if valid_month?
    end
  end

  def get_day
    loop do
      print 'Put the day of birthday '
      @day = gets.chomp.to_i
      break if valid_day?
    end
  end

  def valid_year?
    if year.nil? || year.digits.size != 4
      puts 'The year above is not valid, please verify and input again'
      return
    end

    true
  end

  def valid_month?
    if month.nil? || month.zero? || month > 12
      puts 'The month above is not valid, please verify and input again'
      return
    end

    true
  end

  def valid_day?
    if day.nil? || day.zero? || day > month_days[month]
      puts 'The day above is not valid, please verify and input again'
      return
    end

    true
  end

  def humanize_room_number
    {
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
    }
  end
  alias h humanize_room_number

  def print_result
    puts "This person is #{sort_person.years_old} years and \
    #{sort_person.months_old} months and #{sort_person.days_old} days old".squeeze(' ')
    puts "This person had to go to room #{h[sort_person.which_room_to_go]}"
  end
end

Main.new
