require 'pry'

class DateSorter
  def self.sort_by_date(data)
    data.first.type == 'usaa' ? self.sort_usaa(data) : self.sort_amex(data)
  end

  private

  def self.sort_amex(data)
    data.sort_by{|x| Date.strptime(x.date, "%m/%d/%Y %a")}
  end

  def self.sort_usaa(data)
    data.sort_by{|x| Date.strptime(x.date, "%m/%d/%Y")}
  end
end
