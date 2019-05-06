require_relative 'date_sorter'
require_relative 'categorizer'
require_relative 'expense'
require 'csv'

class Program
  def initialize
    @categorizer = Categorizer.new
    @file_path = ARGV[0]
    @type = ARGV[1]
    @file_name = ARGV[2]
  end

  def create_expenses(data, type)
    if type == 'usaa'
      data.map{|x| Expense.new({date: x[0], amount: make_positive(x[4]), category: '', location: x[2], type: 'usaa'})}
    elsif type == 'amex'
      data.map{|x| Expense.new({date: x[0], amount: x[7], category: '', location: x[2], type: 'usaa'})}
    else
      puts 'Unrecognized account type'
    end
  end

  def make_positive(amount)
    
    (amount.to_f * -1).to_s
  end

  def open_file(file_path)
    CSV.read file_path
  end

  def sort_by_date(data)
    DateSorter.sort_by_date data
  end

  def prompt_category(expense)
    puts "#{expense.location} - #{expense.amount} | category?"
    category = STDIN.gets.chomp!
    expense.category = category
    puts "Would you like this expense to be automatically categorized in the future? If so please enter the business name. ('n' to skip)"
    while business_name = STDIN.gets.chomp!
      case business_name
      when 'n'
        return
      else
        @categorizer.add_location business_name, category
        return
      end
    end
  end

  def save_categorized_expenses data
    CSV.open("./#{@file_name}", "wb") do |csv|
      data.each do |exp|
        csv << [exp.date, exp.amount, exp.category, exp.location]
      end
    end
  end

  def run
    data = open_file(@file_path)
    expenses = create_expenses(data, @type)
    sorted_expenses = sort_by_date(expenses)

    sorted_expenses.each do |expense|
      @categorizer.includes?(expense.location) ? @categorizer.auto_categorize(expense) : prompt_category(expense)
    end

    @categorizer.save_business_categories
    save_categorized_expenses sorted_expenses
  end

end

program = Program.new
program.run
