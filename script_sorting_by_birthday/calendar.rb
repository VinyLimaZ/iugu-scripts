module Calendar
  def month_days
    {
      1 => 31,
      2 => february_days,
      3 => 31,
      4 => 30,
      5 => 31,
      6 => 30,
      7 => 31,
      8 => 31,
      9 => 30,
      10 => 31,
      11 => 30,
      12 => 31
    }
  end

  def february_days
    return 29 if leap_year?

    28
  end

  def leap_year?
    Date.today.leap?
  end
end
