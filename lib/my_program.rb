require_relative 'date_sorter'
require_relative 'field_remover'
require_relative 'categorizer'
require 'csv'
require 'pry'

class Program
  def initialize
    @categorizer = Categorizer.new
  end

  def open_file(file_path)
    CSV.read file_path
  end

  def sort_by_date(data)
    DateSorter.sort_by_date data
  end

  def remove_data_fields(data)
    FieldRemover.remove_data_fields data
  end

  def prompt_category(expense)
    puts "#{expense[3]} category?"
    category = STDIN.gets.chomp!
    expense[2] = category
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
    CSV.open("./newly_categorized_expenses.csv", "wb") do |csv|
      data.each do |exp|
        csv << exp
      end
    end
  end

  def run
    puts "What file do you want to open?"
    file_path = gets.chomp!
    data = remove_data_fields(sort_by_date(open_file(file_path)))

    data.each do |x|
      @categorizer.includes?(x[3]) ? @categorizer.auto_categorize(x) : prompt_category(x)
    end
    
    @categorizer.save_business_categories
    save_categorized_expenses data
  end

end

program = Program.new
program.run
