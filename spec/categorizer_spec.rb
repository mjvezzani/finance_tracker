require 'categorizer'

RSpec.describe Categorizer do
  before :each do
    @categorizer = Categorizer.new
  end

  it 'checks to see if a business name already has a category' do
    expect(@categorizer.includes? "KROGER").to be true
  end

  it 'adds a location/category pair to the existing data set' do
    @categorizer.add_location "FRESH THYME", "F"
    expect(@categorizer.includes? "FRESH THYME").to be true
  end

  it 'automatically categorizes expenses that have been registered with the existing business/category data set' do
    expense = ["KROGER", nil, "19.23"]
    @categorizer.auto_categorize expense
    expect(expense[1]).to eq "F"
  end
end
