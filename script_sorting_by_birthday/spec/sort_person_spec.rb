require 'timecop'
require_relative './../sort_person'

describe SortPerson do
  describe '#which_room_to_go' do
    before { Timecop.freeze(2000, 12, 30) }
    subject { described_class.new(birthday).which_room_to_go }

    describe 'says that have to go to room one if' do
      context 'person has less than 25 years 2 months and 15 days' do
        let(:birthday) { [1975, 10, 16] }

        it { is_expected.to eq(1) }
      end

      context 'person has exactly 25 years 2 months and 15 days' do
        let(:birthday) { [1975, 10, 15] }

        it { is_expected.to eq(1) }
      end
    end

    describe 'says that have to go to room two if' do
      context 'person has more than 25 years 2 months and 15 days' do
        let(:birthday) { [1975, 10, 14] }

        it { is_expected.to eq(2) }
      end

      context '45 years and 1 month' do
        let(:birthday) { [1955, 11, 30] }

        it { is_expected.to eq(2) }
      end
    end

    describe 'says that have to go to room three if' do
      context 'person has 45 years 1 month and 1 day' do
        let(:birthday) { [1955, 11, 29] }

        it { is_expected.to eq(3) }
      end

      context 'person has exactly 65 years' do
        let(:birthday) { [1935, 12, 30] }

        it { is_expected.to eq(3) }
      end
    end

    describe 'says that have to go to room four if' do
      let(:birthday) { [1935, 12, 29] }

      context 'person has more than 65 years' do
        it { is_expected.to eq(4) }
      end
    end
  end
end
