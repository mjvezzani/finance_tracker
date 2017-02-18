class DateSorter
  def self.sort_by_date(data)
    data.sort_by{|x| Date.strptime(x[0], "%m/%d/%Y %a")}
  end
end
