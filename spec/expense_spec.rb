require 'expense'

RSpec.describe Expense do
  before :each do
    @expense = Expense.new({date: '02/11/2000', amount: '12.95', location: 'Kroger', category: 'F', type: 'usaa'})
  end

  it 'has a date' do
    expect(@expense.date).to eq '02/11/2000'
  end

  it 'has an amount' do
    expect(@expense.amount).to eq '12.95'
  end

  it 'has a location' do
    expect(@expense.location).to eq 'Kroger'
  end

  it 'has a category' do
    expect(@expense.category).to eq 'F'
  end

  it 'has a type' do
    expect(@expense.type).to eq 'usaa'
  end
end
