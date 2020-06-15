require 'date'
require 'forwardable'
require_relative 'dob_date'

class SortPerson
  attr_reader :dob
  extend Forwardable

  def_delegators :@dob_date, :years_old, :months_old, :days_old, :month_days

  def initialize(dob_ary)
    @dob = Date.new(*dob_ary)
    @dob_date = DobDate.new(@dob)
  end

  def which_room_to_go
    room_one || room_two || room_three || 4
  end

  private
  def room_one
    return if years_old > 25
    return 1 if years_old < 25

    1 if months_old < 2 ||
      months_old == 2 && days_old <= 15
  end

  def room_two
    return if years_old > 45
    return 2 if years_old < 45

    2 if months_old < 1 ||
      months_old == 1 && days_old == 0
  end

  def room_three
    return if years_old > 65
    return 3 if years_old < 65

    3 if months_old == 0 &&
      days_old == 0
  end
end
