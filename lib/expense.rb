class Expense
  attr_reader :date, :amount, :category, :location, :type
  attr_writer :category

  def initialize(args)
    @date = args[:date]
    @amount = args[:amount]
    @category = args[:category]
    @location = args[:location]
    @type = args[:type]
  end
end
