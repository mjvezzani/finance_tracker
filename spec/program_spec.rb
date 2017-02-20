require 'my_program'
require 'csv'

RSpec.describe Program do
  before :each do
    @program = Program.new
  end

  describe '#create_expenses' do
    it 'for an amex account creates and array of expenses' do
      data = CSV.read('./spec/test_files/amex_example.csv')
      expenses = @program.create_expenses(data, 'amex')
      expect(expenses.first.date).to eq '12/12/2016  Mon'
    end

    it 'for a usaa account creates and array of expenses' do
      data = CSV.read('./spec/test_files/usaa_example.csv')
      expenses = @program.create_expenses(data, 'usaa')
      expect(expenses.first.date).to eq '2/17/17'
    end
  end

  it '#open_file opens a csv file' do
    expected = CSV.read('./spec/test_files/amex_example.csv')
    actual = @program.open_file('./spec/test_files/amex_example.csv')
    expect(actual).to eq expected
  end
end
