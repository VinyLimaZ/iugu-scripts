require 'timecop'
require_relative './../dob_date'

describe DobDate do
  describe '#years_old' do
    subject { DobDate.new(dob).years_old }

    context 'when person already had birthday' do
      let(:dob) { Date.new(1990, 12, 25) }
      before { Timecop.freeze(2000, 12, 25) }

      it { is_expected.to eq 10 }
    end

    context 'when person not had birthday' do
      let(:dob) { Date.new(1990, 12, 25) }
      before { Timecop.freeze(2000, 12, 24) }

      it { is_expected.to eq 9 }
    end

    describe 'if person birth was on february 29' do
      let(:dob) { Date.new(2000, 02, 29) }

      context 'if is 28 still not completed a birthday' do
        before { Timecop.freeze(2010, 02, 28) }

        it { is_expected.to eq 9 }
      end

      context 'if is March 1 completed a birthday' do
        before { Timecop.freeze(2010, 03, 1) }

        it { is_expected.to eq 10 }
      end
    end
  end

  describe '#months_old' do
    subject { DobDate.new(dob).months_old }

    context 'on birthday' do
      let(:dob) { Date.new(1990, 12, 25) }
      before { Timecop.freeze(2000, 12, 25) }

      it { is_expected.to eq 0 }
    end

    context 'one day after the birthday' do
      let(:dob) { Date.new(1990, 12, 25) }
      before { Timecop.freeze(2000, 12, 24) }

      it { is_expected.to eq 0 }
    end

    context 'one day before complete 1 month' do
      let(:dob) { Date.new(1990, 11, 25) }
      before { Timecop.freeze(2000, 12, 24) }

      it { is_expected.to eq 0 }
    end

    context 'on day that complete 1 month' do
      let(:dob) { Date.new(1990, 11, 25) }
      before { Timecop.freeze(2000, 12, 25) }

      it { is_expected.to eq 1 }
    end

    describe 'if person birth was on february 29' do
      let(:dob) { Date.new(2000, 02, 29) }

      context 'if is 28 still not completed a month' do
        before { Timecop.freeze(2010, 02, 28) }

        it { is_expected.to eq 0 }
      end

      context 'if is March 29 completed a birthday' do
        before { Timecop.freeze(2010, 03, 29) }

        it { is_expected.to eq 1 }
      end
    end
  end

  describe '#days_old' do
    subject { DobDate.new(dob).days_old }

    context 'when person birthday is today' do
      let(:dob) { Date.new(1990, 12, 25) }
      before { Timecop.freeze(2000, 12, 25) }

      it { is_expected.to eq 0 }
    end

    context 'when person not had birthday' do
      let(:dob) { Date.new(1990, 12, 25) }
      before { Timecop.freeze(2000, 12, 24) }

      it { is_expected.to eq 29 }
    end

    context 'when person made birthday yesterday' do
      let(:dob) { Date.new(1990, 12, 25) }
      before { Timecop.freeze(2000, 12, 26) }

      it { is_expected.to eq 1 }
    end

    context 'when person made birthday 11 days ago passing an year' do
      let(:dob) { Date.new(1990, 12, 25) }
      before { Timecop.freeze(2001, 1, 5) }

      it { is_expected.to eq 11 }
    end

    context 'when person made birthday 15 days ago' do
      let(:dob) { Date.new(1990, 05, 16) }
      before { Timecop.freeze(2001, 6, 31) }

      it { is_expected.to eq 15 }
    end

    context 'when person will make birthday in 10 days' do
      let(:dob) { Date.new(1990, 05, 26) }
      before { Timecop.freeze(2001, 4, 16) }

      it { is_expected.to eq 21 }
    end

    context 'when person will make birth this month in 13 days' do
      let(:dob) { Date.new(1990, 05, 26) }
      before { Timecop.freeze(2001, 5, 13) }

      it { is_expected.to eq 17 }
    end

    describe 'if person birth was on february 29' do
      let(:dob) { Date.new(2000, 02, 29) }

      context 'if is 28 still not completed a birthday' do
        before { Timecop.freeze(2010, 02, 28) }

        it { is_expected.to eq 30 }
      end

      context 'if is March 1 completed a birthday' do
        before { Timecop.freeze(2010, 03, 1) }

        it { is_expected.to eq 0 }
      end
    end
  end
end
