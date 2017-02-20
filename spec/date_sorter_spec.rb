require 'my_program'
require 'date_sorter'

RSpec.describe DateSorter do
  describe "#sort_by_date(data)" do
    it 'for amex returns an array of data sorted by date' do
      @program = Program.new
      data = [
        Expense.new({date: '06/05/2016 Sun', amount: '31.29', category: '', type: 'amex', location: 'ELIS'}),
        Expense.new({date: '06/04/2016 Sat', amount: '10.01', category: '', type: 'amex', location: 'Kroger'}),
        Expense.new({date: '06/03/2016 Fri', amount: '13.27', category: '', type: 'amex', location: 'Target'}),
        Expense.new({date: '06/02/2016 Thu', amount: '20.25', category: '', type: 'amex', location: 'Sleepy Bee'}),
        Expense.new({date: '06/01/2016 Wed', amount: '88.98', category: '', type: 'amex', location: 'Fresh Thyme'})
      ]
      actual = @program.sort_by_date(data)
      expect(actual.first.location).to eq "Fresh Thyme"
    end

    it 'for usaa returns an array of data sorted by date' do
      @program = Program.new
      data = [
        Expense.new({date: '06/05/2016', amount: '31.29', category: '', type: 'usaa', location: 'ELIS'}),
        Expense.new({date: '06/04/2016', amount: '10.01', category: '', type: 'usaa', location: 'Kroger'}),
        Expense.new({date: '06/03/2016', amount: '13.27', category: '', type: 'usaa', location: 'Target'}),
        Expense.new({date: '06/02/2016', amount: '20.25', category: '', type: 'usaa', location: 'Sleepy Bee'}),
        Expense.new({date: '06/01/2016', amount: '88.98', category: '', type: 'usaa', location: 'Fresh Thyme'})
      ]
      actual = @program.sort_by_date(data)
      expect(actual.first.location).to eq "Fresh Thyme"
    end
  end
end
