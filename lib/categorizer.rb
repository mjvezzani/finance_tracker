require 'csv'

class Categorizer
  attr_reader :business_categories

  def initialize
    @business_categories = CSV.read('./lib/business_categories.csv')
  end

  def includes? business_name
    @business_categories.any?{|name, cat| business_name.include? name.to_s}
  end

  def add_location business_name, category
    @business_categories << [business_name, category]
  end

  def auto_categorize expense
    business_category = @business_categories.select{|x| expense.location.include?(x[0])}.flatten
    expense.category = business_category[1]
  end

  def save_business_categories
    CSV.open('./lib/business_categories.csv', 'wb') do |csv|
      @business_categories.each do |cat|
        csv << cat
      end
    end
  end
end
