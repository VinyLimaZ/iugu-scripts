#!ruby

class MagicNumbers
  def initialize(number)
    @number_to_verify = number
  end

  def esoteric?
    @number_to_verify % 3 == 0 &&
      @number_to_verify % 5 == 0
  end

  def cetic?
    !esoteric?
  end

  def prime?
    !not_prime?
  end

  def not_prime?
    # Prime.instance.prime?(number)
    [2, 3, 5, 7].find do |divider|
      @number_to_verify != divider &&
        @number_to_verify % divider == 0
    end
  end
end
