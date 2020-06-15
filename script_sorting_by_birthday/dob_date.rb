# A class to deal with date based on a date (in this case a dob)
require_relative 'month_days'

class DobDate
  attr_reader :dob
  include Calendar

  def initialize(dob)
    @dob = dob
  end

  def years_old
    year = (date_now.year - dob.year)
    year -= 1 if will_birthday?
    year
  end

  def months_old
    month = months_without_correction
    month -= 1 if days_without_correction.negative?
    month = 0 if month.negative?

    month
  end

  def days_old
    return days_without_correction if days_without_correction.positive? || days_without_correction.zero?
    return fix_negative_days if days_without_correction.negative?

    days_without_correction
  end

  private
  def will_birthday?
    return true if month_now < month_dob
    return true if month_now == month_dob && day_now < day_dob

    false
  end

  def date_now
    Date.today
  end

  def month_now
    date_now.month
  end

  def previous_month
    date_now.prev_month.month
  end

  def day_now
    date_now.day
  end

  def month_dob
    dob.month
  end

  def day_dob
    dob.day
  end

  def current_year
    date_now.year
  end

  def months_without_correction
    date_now.month - dob.month
  end

  def days_without_correction
    date_now.day - dob.day
  end

  def fix_negative_days
    (month_days[previous_month] - day_dob) + day_now
  end
end
