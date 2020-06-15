require 'spec_helper'
require_relative './../magic_numbers'

describe MagicNumbers do
  let(:result) { [] }
  let(:first_20_numbers) { [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] }
  describe '#prime?' do
    it 'returns true if a number is prime or false if isnt' do
      first_20_numbers.each do |number|
        result << MagicNumbers.new(number).prime?
      end
      expect(result).to match(
        [true, true, true, false, true, false, true, false, false, false, true,
          false, true, false, false, false, true, false, true]
      )
    end

    describe '#esoteric?' do
      it 'returns true if a number is esoteric or false if isnt' do
        first_20_numbers.each do |number|
          result << MagicNumbers.new(number).esoteric?
        end
        expect(result).to match(
          [false, false, false, false, false, false, false, false, false, false,
           false, false, false, false, true, false, false, false, false]
        )
      end
    end

    describe '#cetic?' do
      it 'returns the opposite of #esoteric?' do
        first_20_numbers.each do |number|
          result << MagicNumbers.new(number).cetic?
        end
        expect(result).to match(
          [true, true, true, true, true, true, true, true, true, true, true,
           true, true, true, false, true, true, true, true]
        )
      end
    end
  end
end
